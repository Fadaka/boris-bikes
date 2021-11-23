require 'docking_station'
require 'bike'
require 'bikecontainer'
require 'van'


describe BikeContainer do 
    let(:station) {DockingStation.new} 
    let(:ven) {Van.new}
    let(:garage) {Garage.new}
    let(:bike) { double :bike, working?: true}
    let(:broken_bike) {double :broken_bike, working?: false}

    it 'should be able to dock(store) an object' do
        station.dock(bike)
        expect(station.docked_bikes.length).to be(1)
    end

    it 'exception is raised to not release bikes' do
        expect{station.release_bike(station)}.to raise_error(RuntimeError, "Dock is empty, no bikes to release")
    end

    it 'exception is raised not to recieve any more bikes' do
        garage.dock(bike)
        expect{(Garage::DEFAULT_CAPACITY+1).times{garage.dock(bike)}}.to raise_error(RuntimeError, "Dock is currently full")
    end

    it 'should set a value for the maximum capacity of an instance ' do
        expect(Garage.new(5).capacity).to eq(5) 
    end

    it 'should set the capacity to the default capacity(20) when none is given' do
        expect(station.capacity).to eq(20)
    end

    it 'working bike should be released' do
        station.dock(bike)
        station.dock(broken_bike)
        station.release_bike(station,bike)
        expect(station.docked_bikes).to match_array(broken_bike)
    end

    it 'fail should be raised to stop broken bikes being released'do
        station.dock broken_bike
        p station.docked_bikes
        expect{station.release_bike(station, broken_bike)}.to raise_error("Sorry this bike is broken and cannot be released")
    end

    it 'should accept both working and broken bikes' do
        ven.dock(bike)
        ven.dock(broken_bike)
        expect(ven.docked_bikes).to match_array([bike, broken_bike]) 
    end
end