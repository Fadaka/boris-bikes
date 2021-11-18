class DockingStation
    attr_reader :docked_bikes
    def initialize
        @docked_bikes = []
    end

    def release_bike
        if @docked_bikes.empty?
            raise "Dock is empty, no bikes to release"
        else 
            Bike.new
        end
    end
    
    def dock(bike)
        if @docked_bikes.length == 1
            raise "Dock is currently full"
        end
        @docked_bikes.push(bike)
        p @docked_bikes
        return true
    end
end