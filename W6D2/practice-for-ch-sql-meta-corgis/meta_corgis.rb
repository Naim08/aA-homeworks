# frozen_string_literal: true

# Represents a collection of snacks for corgis.
class SnackBox
  SNACK_BOX_DATA = {
    1 => {
      'bone' => {
        'info' => "Phoenician rawhide",
        "tastiness" => 20,
      },
      'kibble' => {
        "info" => "Delicately braised hamhocks",
        'tastiness' => 33,
      },
      "treat" => {
        "info" => "Chewy dental sticks",
        "tastiness" => 40,
      },
    },
    2 => {
      "bone" => {
        "info" => "An old dirty bone",
        "tastiness" => 2,
      },
      "kibble" => {
        "info" => "Kale clusters",
        "tastiness" => 1,
      },
      "treat" => {
        "info" => "Bacon",
        "tastiness" => 80,
      },
    },
    3 => {
      "bone" => {
        "info" => "A steak bone",
        "tastiness" => 64,
      },
      "kibble" => {
        "info" => "Sweet Potato nibbles",
        "tastiness" => 45,
      },
      "treat" => {
        "info" => "Chicken bits",
        "tastiness" => 75,
      },
    }
  }.freeze

  def initialize(data = SNACK_BOX_DATA)
    @data = data
  end

  def get_bone_info(box_id)
    @data[box_id]["bone"]["info"]
  end

  def get_bone_tastiness(box_id)
    @data[box_id]["bone"]["tastiness"]
  end

  def get_kibble_info(box_id)
    @data[box_id]["kibble"]["info"]
  end

  def get_kibble_tastiness(box_id)
    @data[box_id]["kibble"]["tastiness"]
  end

  def get_treat_info(box_id)
    @data[box_id]["treat"]["info"]
  end

  def get_treat_tastiness(box_id)
    @data[box_id]["treat"]["tastiness"]
  end
end

# Represents a collection of snacks for corgis.
class CorgiSnacks
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  def bone
    info = @snack_box.get_bone_info(@box_id)
    tastiness = @snack_box.get_bone_tastiness(@box_id)
    result = "Bone: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def kibble
    info = @snack_box.get_kibble_info(@box_id)
    tastiness = @snack_box.get_kibble_tastiness(@box_id)
    result = "Kibble: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end

  def treat
    info = @snack_box.get_treat_info(@box_id)
    tastiness = @snack_box.get_treat_tastiness(@box_id)
    result = "Treat: #{info}: #{tastiness} "
    tastiness > 30 ? "* #{result}" : result
  end
end

# Represents a meta corgi snack box
class MetaCorgiSnacks
  # BEGIN: ed8c6549bwf9

  # END: ed8c6549bwf9
  def initialize(snack_box, box_id)
    @snack_box = snack_box
    @box_id = box_id
  end

  # def method_missing(name, *args)
  #   method_name = name.to_s
  #   if method_name.include?("bone") || method_name.include?("kibble") || method_name.include?("treat")
  #     info = @snack_box.send("get_#{method_name}_info", @box_id)
  #     tastiness = @snack_box.send("get_#{method_name}_tastiness", @box_id)
  #     result = "#{method_name.capitalize}: #{info}: #{tastiness} "
  #     tastiness > 30 ? "* #{result}" : result
  #   else
  #     super
  #   end
  # end
  def method_missing(name, *args)
    method_name = name.to_s
    if %w[bone kibble treat].include?(method_name)
      self.class.define_snack(method_name)
      send(method_name)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    %w[bone kibble treat].include?(method_name.to_s) || super
  end

  def self.define_snack(name)
    define_method(name) do
      method_name = name.to_s
      info = @snack_box.send("get_#{method_name}_info", @box_id)
      tastiness = @snack_box.send("get_#{method_name}_tastiness", @box_id)
      result = "#{method_name.capitalize}: #{info}: #{tastiness} "
      tastiness > 30 ? "* #{result}" : result
    end
  end
end

snack_box = SnackBox.new
meta_snacks = MetaCorgiSnacks.new(snack_box, 1)
p meta_snacks.bone
p meta_snacks.kibble
p meta_snacks.treat

class Corgi
  def self.bark(sound)
    define_method(sound) { puts sound}
  end

  bark(:hello)
  bark(:world)
end

c = Corgi.new
p.bark
