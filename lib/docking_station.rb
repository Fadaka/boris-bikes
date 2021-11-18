class DockingStation
    attr_reader :docked_bikes
    def initialize
        @docked_bikes = []
    end

    def release_bike
        Bike.new
        
    end
    
    def dock(bike)
        @docked_bikes.push(bike)
        p @docked_bikes
        return true
    end
end