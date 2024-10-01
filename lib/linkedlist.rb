class LinkedList
  attr_accessor :size, :head, :tail

  def initialize 
    @size = 0
    #head returns the first node in the list
    @head = nil
    #tail returns the last node in the list
    @tail = nil
  end

  #append(value) adds a new node containing value to the end of the list
  def append(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
    else
      current_node = @head
      until current_node.next_node.nil?
        current_node = current_node.next_node
      end
      current_node.next_node = value
    end 
    @tail = value
    @size += 1
  end

  #prepend(value) adds a new node containing value to the start of the list
  def prepend(value)
    value = Node.new(value)
    if @head.nil?
      @head = value
    else
      value.next_node = @head
      new_number_one= Node.new(@head.value) #because head is 0 old head is #1
      new_number_one.next_node = @head.next_node
      @head = value
    end
    @size += 1
  end

  #pop removes the last element from the list
  def pop
    current_node = @head
    until current_node.next_node == @tail
      current_node = current_node.next_node
    end
    tail_node = current_node.next_node
    current_node.next_node = nil
    @tail = current_node
    tail_node = nil
    @size -= 1  
  end

  #to_s represent your LinkedList objects as strings, so you can print them out and preview them in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    temp = @head
    list_to_s = String.new
    while temp
      list_to_s += temp.value.to_s
      list_to_s += '->'
      temp = temp.next_node
    end
    list_to_s += 'nil'
  end

  
  

  #at(index) returns the node at the given index
  def at(index)
    current_node = @head
    count = 0
    until count == index || current_node.nil?
      current_node = current_node.next_node
      count += 1
    end
    if current_node.nil?
      nil
    else
      current_node.value
    end
  end

  #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    current_node = @head
    return false if current_node.nil?
    return true if value == current_node.value[0]
    until current_node.next_node.nil?
      current_node = current_node.next_node
      return true if value == current_node.value[0]
    end
    return false
  end

  #find(value) returns the index of the node containing value, or nil if not found.
  def find(value)
    current_node = @head
    count = 0
    return count if value == @head.value[0]
    until current_node.value[0] == value || current_node.next_node.nil?
      current_node = current_node.next_node
      count += 1
      return count if value == current_node.value[0]
    end
    return nil
  end

  #insert_at(value, index) that inserts a new node with the provided value at the given index.
  def insert_at(value, index)
    value = Node.new(value)
    count = 0
    current_node = @head
    if index == count
      self.prepend(value.value)
    elsif index < 0
      index = @size + index
      until count == (index)
        current_node = current_node.next_node
        count += 1
      end
    else
      until count == (index-1)
        current_node = current_node.next_node
        count += 1
      end
      value.next_node = current_node.next_node
      current_node.next_node = value
      if value.next_node.nil?
        @tail = value
      end
      @size += 1
    end
  end

  #remove_at(index) that removes the node at the given index.

  def remove_at(index)
    current_node = @head
    count = 0
    if index > @size
      return "too big!"
    elsif index < 0
      index = @size + index
      puts index
      until count == (index-1) 
        current_node = current_node.next_node
        count += 1
      end
    else
      until count == (index - 1) || index == 0
        current_node = current_node.next_node
        count += 1
      end
    end
    if index == 0 
      @head = current_node
      if current_node.next_node.nil? 
        "hi"
        @head = nil
        @tail = nil
        @size = nil 
        return current_node.value = nil
      else
        soon_to_be_snipped_node = current_node
        new_next_node = current_node.next_node
        current_node = soon_to_be_snipped_node.next_node
        current_node.next_node = new_next_node.next_node
        @head = current_node
        @tail = current_node if current_node.next_node.nil?
      end
    
    else
      soon_to_be_snipped_node = current_node.next_node
      if soon_to_be_snipped_node.next_node.nil? 
        @tail = current_node
      end
      current_node.next_node = soon_to_be_snipped_node.next_node
      soon_to_be_snipped_node = nil
    end
    @size -= 1
  end

end

