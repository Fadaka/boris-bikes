require 'docking_station'
require 'bike'

describe DockingStation do 
    it 'Release bike method releases a bike object and tests if working' do
        docking_station = DockingStation.new([])
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
        docking_station = DockingStation.new([])
        bmx = Bike.new
        docking_station.dock(bmx)
        expect(docking_station.docked_bikes.length).to be(1)
    end
end