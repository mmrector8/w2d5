class Flight 
     
    attr_reader :passengers
    def initialize(flight_number, capacity)
        @flight_number = flight_number
        @capacity = capacity
        @passengers = []
    end

    def full?
        if @passengers.length == @capacity
            return true
        else
            false
        end
    end

    def board_passenger(passenger)
        #if the flight is not full and the passenger has the flight num
        if !self.full? && passenger.has_flight?(@flight_number)
            @passengers << passenger
        end
    end

    def list_passengers
        passenger_arr = []
        #loop through passengers array
        @passengers.each do |passenger|
            passenger_arr << passenger.name
        end
        passenger_arr
    end

    def [](index)
        @passengers[index]
    end

    def <<(passenger)
        board_passenger(passenger)
    end
end