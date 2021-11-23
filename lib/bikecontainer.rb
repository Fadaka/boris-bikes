require_relative "./bike.rb"
require "docking_station"

module BikeContainer

    attr_reader :docked_bikes , :capacity
    DEFAULT_CAPACITY = 20

    def initialize (capacity = DEFAULT_CAPACITY)
        @docked_bikes = []
        @capacity = capacity
    end

    def release_bike(released_by=nil, bike=nil)
        if empty?
            raise "Dock is empty, no bikes to release"
        elsif bike.working? == false && released_by.is_a?(DockingStation)
            #released_by.is_a? DockingStation
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