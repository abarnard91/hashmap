
class HashMap
  attr_accessor :hashmap, :num_of_keys, :buckets
  
  def initialize
    @load_factor = 0.75
    @buckets = 16 
    @hashmap = Array.new(@buckets)
    @num_of_keys = 0
  end

  def modulo_num(num)
    bucket = num % @buckets
    bucket
  end

  def hash(key)
     hash_code = 0
     prime_number = 31
     key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
     hash_code
   end

  def resize
    if (@num_of_keys.to_f/@buckets)> @load_factor
      @buckets *= 2
      stored_data = self.entries
      @hashmap.each do |bucket|
        unless bucket.nil?
          bucket = nil
        end
      end
      @num_of_keys = 0
      @hashmap = Array.new(@buckets)
      stored_data.each do |array|
        self.set(array[0],array[1])
      end    
    end
  end
  
  #set(key, value) takes two arguments, the first is a key and the second is a value that is assigned to this key. If a key already exists, then the old value is overwritten or we can say that we update the key’s value (e.g. Carlos is our key but it is called twice: once with value I am the old value., and once with value I am the new value.. From the logic stated above, Carlos should contain only the latter value).
  def set(key, value)
    hashcode = hash(key)
    bucket = modulo_num(hashcode)
    if @hashmap[bucket].nil?
      @hashmap[bucket] = LinkedList.new
    else
      if @hashmap[bucket].contains?(key)
        index = @hashmap[bucket].find(key)
        @hashmap[bucket].remove_at(index)
        @num_of_keys -= 1
      end
    end
    @hashmap[bucket].append([key,value])
    @num_of_keys += 1
    self.resize
  end

  #get(key) takes one argument as a key and returns the value that is assigned to this key. If key is not found, return nil.
  def get(key)
    bucket = 0
    @buckets.times do
      if @hashmap[bucket].nil? == false && @hashmap[bucket].contains?(key) 
        index = @hashmap[bucket].find(key)
        key_value = @hashmap[bucket].at(index)
        return key_value[1]
      end
      bucket += 1
    end
    false
  end  
    
  #has?(key) takes a key as an argument and returns true or false based on whether or not the key is in the hash map.
  def has?(key)
    bucket = 0
   @buckets.times do
      if @hashmap[bucket].nil? == false && @hashmap[bucket].contains?(key) 
        return true
      end
      bucket += 1
    end
    false
  end  

  #remove(key) takes a key as an argument. If the given key is in the hash map, it should remove the entry with that key and return the deleted entry’s value. If the key isn’t in the hash map, it should return nil.

  def remove(key)
    bucket = 0
    while bucket < @buckets do
      if @hashmap[bucket] != nil && @hashmap[bucket].contains?(key) 
        index = @hashmap[bucket].find(key)
        @hashmap[bucket].remove_at(index)
        if @hashmap[bucket].head == nil
          @hashmap[bucket] = nil
        end
        @num_of_keys -= 1
        break
      end
      bucket += 1
    end
    nil
  end
  
  #length returns the number of stored keys in the hash map.  
  def length
    count = 0
    @hashmap.each_with_index do |key, bucket| 
      unless key.nil?
        count += @hashmap[bucket].size
      end
    end
    count
  end

  #clear removes all entries in the hash map.
  def clear
    @hashmap.each do |bucket|
      unless bucket.nil?
        bucket = nil
      end
    end
    @num_of_keys = 0
    @hashmap = Array.new(@buckets)
    @buckets = 16
  end
    

  #keys returns an array containing all the keys inside the hash map.
  def keys
    key_array = Array.new
    index = 0
    @hashmap.each_with_index do |key, bucket| 
      unless key.nil?
        until @hashmap[bucket].at(index).nil?
          key_value = @hashmap[bucket].at(index)
          key_array << key_value[0]
          index += 1
        end
      end
      index = 0
    end
    key_array
  end

  #values returns an array containing all the values.
  def values
    key_array = Array.new
    index = 0
    @hashmap.each_with_index do |key, bucket| 
      unless key.nil?
        until @hashmap[bucket].at(index).nil?
          key_value = @hashmap[bucket].at(index)
          key_array << key_value[1]
          index += 1
        end
      end
      index = 0
    end
    key_array
  end

  #entries returns an array that contains each key, value pair. Example: [[first_key, first_value], [second_key, second_value]]
  def entries
    key_array = Array.new
    index = 0
    @hashmap.each_with_index do |key, bucket| 
      unless key.nil?
        until @hashmap[bucket].at(index).nil?
          key_value = @hashmap[bucket].at(index)
          key_array << key_value
          index += 1
        end
      end
      index = 0
    end
    key_array
  end
end
