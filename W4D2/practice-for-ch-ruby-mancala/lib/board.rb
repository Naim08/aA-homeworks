class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1
    @player2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    cups.each_with_index do |cup, i|
      next if i == 6 || i == 13
      4.times { cup << :stone }
    end
  end

  def valid_move?(start_pos)
    if start_pos < 0 || start_pos > 12
      raise "Invalid starting cup"
    end
    if cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx += 1
      cup_idx = 0 if cup_idx > 13

      if cup_idx == 6
        cups[6] << stones.pop if current_player_name == @player1
      elsif cup_idx == 13
        cups[13] << stones.pop if current_player_name == @player2
      else
        cups[cup_idx] << stones.pop
      end
    end

    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    puts "      #{cups[7..12].reverse.join(" ")}"
    puts " #{cups[13]}                  #{cups[6]}"
    puts "      #{cups[0..5].join(" ")}"
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    case cups[6].length <=> cups[13].length
    when -1
      @player2
    when 0
      :draw
    when 1
      @player1
    end
  end
end
