require_relative "./bike.rb"

class Van
    attr_reader :docked_bikes , :capacity
    DEFAULT_CAPACITY = 10
    def initialize (capacity = DEFAULT_CAPACITY)
        @docked_bikes = []
        @capacity = capacity
    end

    def release_bike(bike=nil)
        if empty?
            raise "Dock is empty, no bikes to release"
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