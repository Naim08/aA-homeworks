class Node
  attr_accessor :value, :next_node

  def initialize(value)
    # Initialize the node with the given value and a next node of nil
    @value = value
    @next_node = nil
  end
end


class Stack
  def initialize
    # Initialize the top of the stack to nil
    @top = nil
  end

  def push(el)
    # Create a new node with the given value
    new_node = Node.new(el)
    # If the stack is empty, set the new node as the top of the stack
    if @top.nil?
      @top = new_node
    else
      # If the stack is not empty, set the new node's next node to the current top of the stack
      new_node.next_node = @top
      # Set the new node as the new top of the stack
      @top = new_node
    end
  end

  def pop
    # If the stack is empty, return nil
    return nil if @top.nil?
    # Get the value of the top node
    top_value = @top.value
    # Set the next node as the new top of the stack
    @top = @top.next_node
    # Return the value of the original top node
    top_value
  end

  def peek
    # If the stack is empty, return nil
    return nil if @top.nil?
    # Return the value of the top node without removing it
    @top.value
  end
end

class Queue
  def initialize
    # Initialize the front and back of the queue to nil
    @front = nil
    @back = nil
  end

  def enqueue(el)
    # Create a new node with the given value
    new_node = Node.new(el)
    # If the queue is empty, set the new node as both the front and back of the queue
    if @front.nil?
      @front = new_node
      @back = new_node
    else
      # If the queue is not empty, set the current back of the queue's next node to the new node
      @back.next_node = new_node
      # Set the new node as the new back of the queue
      @back = new_node
    end
  end

  def dequeue
    # If the queue is empty, return nil
    return nil if @front.nil?
    # Get the value of the front node
    first_value = @front.value
    # Set the next node as the new front of the queue
    @front = @front.next_node
    # If the front is now nil, set the back to nil as well
    @back = nil if @front.nil?
    # Return the value of the original front node
    first_value
  end

  def peek
    # If the queue is empty, return nil
    return nil if @front.nil?
    # Return the value of the front node without removing it
    @front.value
  end
end

class Map
  def initialize
    # Initialize the map as an empty array
    @map = []
  end

  def set(key, value)
    # Check if the key already exists in the map
    pair_index = @map.index { |pair| pair[0] == key }
    if pair_index
      # If the key already exists, update the value
      @map[pair_index][1] = value
    else
      # If the key does not exist, add a new key-value pair to the map
      @map.push([key, value])
    end
  end

  def get(key)
    # Find the key-value pair with the given key
    pair = @map.find { |pair| pair[0] == key }
    # Return the value if the key exists, or nil if it does not
    pair ? pair[1] : nil
  end

  def delete(key)
    # Remove the key-value pair with the given key from the map
    @map.reject! { |pair| pair[0] == key }
  end

  def show
    # Return a deep copy of the map to prevent modification
    Marshal.load(Marshal.dump(@map))
  end
end

# Test the Stack class
stack = Stack.new

# Test pushing elements onto the stack
stack.push(1)
stack.push(2)
stack.push(3)

# Test peeking at the top element of the stack
puts stack.peek # Output: 3

# Test popping elements off the stack
puts stack.pop # Output: 3
puts stack.pop # Output: 2
puts stack.pop # Output: 1
puts stack.pop # Output: nil

# Test the Queue class
queue = Queue.new

# Test adding elements to the queue
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)

# Test peeking at the front element of the queue
puts queue.peek # Output: 1

# Test removing elements from the queue
puts queue.dequeue # Output: 1
puts queue.dequeue # Output: 2
puts queue.dequeue # Output: 3
puts queue.dequeue # Output: nil


# Test the Map class
map = Map.new

# Test setting key-value pairs in the map
map.set("a", 1)
map.set("b", 2)
map.set("c", 3)

# Test getting values from the map
puts map.get("a") # Output: 1
puts map.get("b") # Output: 2
puts map.get("c") # Output: 3
puts map.get("d") # Output: nil

# Test updating values in the map
map.set("a", 4)
puts map.get("a") # Output: 4

# Test deleting key-value pairs from the map
map.delete("b")
puts map.get("b") # Output: nil

# Test showing the contents of the map
puts map.show # Output: [["a", 4], ["c", 3]]
