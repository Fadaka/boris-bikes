class DockingStation
    def initialize 
        @docked_bikes = []
    end

    def release_bike
    
    end
    
    def dock(bike)
        @docked_bikes.push(bike)
        p @docked_bikes
        return true
    end
end