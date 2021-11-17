require 'docking_station'
require 'bike'

describe DockingStation do 
    it 'DockingStation responds to release_bike' do
        docking_station = DockingStation.new
        expect(docking_station).to respond_to(:release_bike)
    end

    it 'gets a bike from the bike class' do
        bmx = Bike.new
        expect(bmx).to be_an_instance_of(Bike)
    end

    it 'tests if the bike is working' do
        bmx = Bike.new
        expect(bmx.working?).to be true
    end
end