class Node
    @@list_ref = [0]
    attr_accessor :value, :next_node
    def initialize(input)
        @value = input
        @next_node = @@list_ref[-1] + 1
        @@list_ref << next_node
    end
end

class LinkedList
    attr_accessor :linked_list
    def initialize
        @linked_list = {}
    end
    def append(value)
        node = Node.new(value)
        linked_list[node.next_node] = node.value
    end
    def prepend(value)
        node = Node.new(value)
        self.linked_list = self.linked_list.map {|k, v| [k + 1, v]}.to_h
        linked_list[1] = node.value
    end
    def size
        linked_list.count
    end
    def head
        linked_list[1]
    end
    def tails
        linked_list[linked_list.count]
    end
    def at(index)
        linked_list[index]
    end
    def pop
        linked_list.delete(linked_list.count)
    end
    def contains?(value)
        linked_list.any? {|k, v| v == value}
    end
    def find(value)
        linked_list.key(value)
    end
    def to_s
        stringed_list = ''
        for i in 1..linked_list.count
            stringed_list = stringed_list + "(#{linked_list[i]}) - > "
        end
        stringed_list = stringed_list + 'nil'
    end
    def insert_at(value, index)
        node = Node.new(value)
        linked_list.count.downto(index) do |i|
            linked_list[i + 1] = linked_list.delete(i)
        end
        linked_list[index] = value
    end
    def pop(index)
        linked_list.delete(index)
    end
end


