require_relative "./bike.rb"

class DockingStation
    attr_reader :docked_bikes , :capacity
    DEFAULT_CAPACITY = 20
    def initialize (capacity = DEFAULT_CAPACITY)
        @docked_bikes = []
        @capacity = capacity
    end

    def release_bike(bike=nil)
        if empty?
            raise "Dock is empty, no bikes to release"
        elsif bike.working? == false
            raise "Sorry this bike is broken and cannot be released"
        else
            @docked_bikes.delete(bike)

        end
    end
    
    def dock(bike)
        if full?  
            raise "Dock is currently full"
        end
        @docked_bikes.push(bike)
        p @docked_bikes
        return true
    end

  private
    def full?
        if @docked_bikes.length >= @capacity
            return true
        end
    end

    def empty?
       if @docked_bikes.empty?
            return true
       end
    end
end