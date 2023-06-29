class Node
    attr_accessor :value, :next
    def initialize(value=nil)
      @value = value
      @next = nil
    end
  end
  
  class LinkedList
    attr_accessor :list
    def initialize
      @list = nil
    end
    def append(value)
      if @list == nil
        @list = Node.new(value)
      else
        end_of_list.next = Node.new(value)
      end
    end
    def prepend(value)
      list_copy = @list
      @list = Node.new(value)
      @list.next = list_copy
    end
    def end_of_list
      node = @list
      return node if !node.next
      return node if !node.next while (node = node.next)
    end
    def size
      return 0 if list == nil
      node = @list
      count = 1
      until !node.next
        node = node.next
        count += 1
      end
      count
    end
    def head
      @list.value
    end
    def tail
      node = @list
      return node.value if !node.next
      return node.value if !node.next while (node = node.next)
    end
    def at(index)
      node = @list
      count = 0
      until count == index
        node = node.next
        count += 1
      end
      node.value
    end
    def pop
      return 0 if list == nil
      node = @list
      count = 1
      until count == size - 1
        node = node.next
        count += 1
      end
      node.next = nil
    end
    def contains?(value)
      node = @list
      until !node
        return true if value == node.value
        node = node.next
      end
      false
    end
    def find(value)
      node = @list
      count = 1
      until !node
        return count if value == node.value
        node = node.next
        count += 1
      end
      nil
    end
    def to_s
      node = @list
      string = "(#{node.value})"
      until !node.next
        node = node.next
        string = string + " -> (#{node.value})"
      end
      string + ' -> nil'
    end
    def insert_at(value, index)
      return prepend(value) if index == 0
      left_copy = find_at(index)
      right_side = find_at(index - 1)
      right_side.next = Node.new(value)
      right_side.next.next = left_copy
    end
    def find_at(index)
      node = @list
      count = 0
      until count == index
        node = node.next
        count += 1
      end
      node
    end
    def remove_at(index)
      left_copy = find_at(index + 1)
      return @list = left_copy if index == 0
      right_side = find_at(index - 1)
      right_side.next = left_copy 
    end
  end
  
  linked_list = LinkedList.new
  p linked_list.list
  linked_list.append(10)
  p linked_list.list
  linked_list.append(20)
  p linked_list.list
  linked_list.append(30)
  p linked_list.list
  linked_list.prepend(40)
  p linked_list.list
  p linked_list.size
  p linked_list.head
  p linked_list.at(2)
  p linked_list.tail
  linked_list.pop
  p linked_list.tail
  p linked_list.list
  p linked_list.contains?(20)
  p linked_list.find(40)
  p linked_list.to_s
  linked_list.insert_at(11, 1)
  p linked_list.to_s
  linked_list.remove_at(1)
  p linked_list.to_s
  
  
  
  
  