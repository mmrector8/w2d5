class Item

    attr_reader :title, :deadline, :description
    attr_writer :title, :deadline, :description

   def self.valid_date?(date_string)
        #split string at the -
        date_arr = date_string.split("-")
        # if array length is not 3, return false 
         if date_arr.length != 3
            return false
         end
        #change all strings in array into a number
        date_arr.map!{|num| num.to_i}
        #get rid of all inputs with non numeric characters
       return false if date_arr.any?{|ele| ele == 0}
         #if array[0] does not have 4 characters, return false
       return false if date_arr[0].to_s.length != 4
        # if array[1]  is not a number between 1-12 return false
        return false if !date_arr[1][1].between?(1, 12)
        #if array[2] is not a number between 1-31 return false
        return false if !date_arr[2].between?(1, 31)
        true
    end

    def initialize(title, deadline, description)
        @title = title
        if Item.valid_date?(deadline)
            @deadline = deadline
            return true
        else
            raise 'not a valid date'
        end
        @description = description
    end


end

