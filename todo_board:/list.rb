require "./item.rb"

class List
    attr_reader :label
    attr_writer :label

     def initialize(label)
        @label = label 
        @items = []
     end

     def add_item(title, deadline, description=nil) 
        if Item.valid_date?(deadline)
            new_item = Item.new(title, deadline, description)
            @items << new_item
            return true
         else 
            return false
        end
     end

     def size
        @items.length
     end

     def valid_index?(index)
        #if index is less than zero return false
        return false if index < 0
        return false if index > @items.length-1
        true
     end

     def swap(index_1, index_2)
        if !valid_index?(index_1) || !valid_index?(index_2)
            return false
        else
            @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
            true
        end
     end

    def [](index)
        if !valid_index?(index)
            return nil
        else
            @items[index]
        end
    end

    def priority
        @items[0]
    end

    def print

        puts "--------------#{self.label}----------------------"

        @items.each_with_index do |item, i|
            puts "Index: #{i} | Item name: #{item.title} | Deadline: #{item.deadline}"
        end
        puts "-------------------------------------------------"
    end

    def print_full_item(index)
        if !valid_index?(index)
            return false
        end
        puts "-------------------------------------------------"
        puts "Name: #{@items[index].title} | Deadline: #{@items[index].deadline} | Description: #{@items[index].description}" 
       puts "-------------------------------------------------"
       true
    end

    def print_priority
         puts "-------------------------------------------------"
        puts "Name: #{@items[0].title} | Deadline: #{@items[0].deadline} | Description: #{@items[0].description}" 
       puts "-------------------------------------------------"
    end
  
    def up(index, amount=1) # 1, 2
        #if index is invalid, return false
        if !valid_index?(index)
            return false
        end
        i = 0
       while i < amount #index is 0
            @items[index-1], @items[index] = @items[index], @items[index-1]
                index -=1
                 break if index < 1
            i+=1
        end
        true
    end

    def down(index, amount=1)
       return false if !valid_index?(index)
            
        i = 0
       while i < amount-1 #index is 0
            @items[index], @items[index+1] = @items[index+1], @items[index]

            index +=1
                break if index > @items.length-1  
            i+=1
        end
        true
    end

end