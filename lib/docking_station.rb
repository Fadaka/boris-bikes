require_relative "./bike.rb"
require "bikecontainer"

class DockingStation
    attr_reader :docked_bikes , :capacity
    include BikeContainer
end