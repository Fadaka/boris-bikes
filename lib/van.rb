require_relative "./bike.rb"
require "bikecontainer"

class Van
    attr_reader :docked_bikes , :capacity
    include BikeContainer
end