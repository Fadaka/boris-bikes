require 'docking_station'
require 'bike'

describe DockingStation do 
    it 'Release bike method releases a bike object and tests if working' do
        docking_station = DockingStation.new
        bmx = Bike.new
        docking_station.dock(bmx)   
        expect(docking_station.release_bike).to be_an_instance_of(Bike)
        bike = docking_station.release_bike 
        expect(bike.working?).to be(true)
    end

    it 'gets a bike from the bike class' do
        bmx = Bike.new
        expect(bmx).to be_an_instance_of(Bike)
    end

    it 'tests if the bike is working' do
        bmx = Bike.new
        expect(bmx.working?).to be true
    end
    
    it 'docking is possible' do
        docking_station = DockingStation.new
        bmx = Bike.new
        docking_station.dock(bmx)
        expect(docking_station.docked_bikes.length).to be(1)
    end

    it 'exception is raised to not release bikes' do
        docking_station = DockingStation.new
        expect{docking_station.release_bike}.to raise_error(RuntimeError, "Dock is empty, no bikes to release")
    end

    it 'exception is raised not to recieve any more bikes' do
        docking_station = DockingStation.new
        bmx = Bike.new
        docking_station.dock(bmx)
        expect{21.times{docking_station.dock(bmx)}}.to raise_error(RuntimeError, "Dock is currently full")
    end

    it 'should set a value for the maximum capacity of an instance ' do
        docking_station = DockingStation.new(5)
        expect(docking_station.capacity).to eq(5) 
    end

    it 'should set the capacity to the default capacity(20) when none is given' do
        docking_station = DockingStation.new
        expect(docking_station.capacity).to eq(20)
    end

    it 'should not release broken bike' do
        docking_station = DockingStation.new
        b1 = Bike.new
        b2 = Bike.new
        b2.rep_broken_bike
        docking_station.dock(b1)
        docking_station.dock(b2)
        docking_station.release_bike
        expect(docking_station.docked_bikes).to match_array(b2)
    end
end