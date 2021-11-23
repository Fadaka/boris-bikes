require_relative "./bike.rb"

class Garage
    attr_reader :docked_bikes , :capacity
    DEFAULT_CAPACITY = 30
    include BikeContainer
    def fix_bike(bike)
        @working = true
    end
end