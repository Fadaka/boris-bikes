require 'bike'
require 'van'


describe Van do 
    subject(:ven) {described_class.new} 
    let(:bike) { double :bike, working?: true}
    let(:broken_bike) {double :bike, working?: false}


    it 'gets a bike from the bike class' do
        bike = Bike.new
        expect(bike).to be_an_instance_of(Bike)
    end

    it 'tests if the bike is working' do
        expect(bike.working?).to be true
    end
    
    it 'docking is possible' do
        subject.dock(bike)
        expect(subject.docked_bikes.length).to be(1)
    end

    it 'exception is raised to not release bikes' do
        expect{subject.release_bike}.to raise_error(RuntimeError, "Dock is empty, no bikes to release")
    end

    it 'exception is raised not to recieve any more bikes' do
        subject.dock(bike)
        expect{(Van::DEFAULT_CAPACITY+1).times{subject.dock(bike)}}.to raise_error(RuntimeError, "Dock is currently full")
    end

    it 'should set a value for the maximum capacity of an instance ' do
        expect(Van.new(5).capacity).to eq(5) 
    end

    it 'should set the capacity to the default capacity(10) when none is given' do
        expect(subject.capacity).to eq(10)
    end

    it 'working and broken bike should be released ' do
        subject.dock(bike)
        subject.dock(broken_bike)
        subject.release_bike(bike)
        subject.release_bike(broken_bike)
        expect(subject.docked_bikes).to match_array([])
    end

    it 'should accept both working and broken bikes' do
        subject.dock(bike)
        subject.dock(broken_bike)
        expect(subject.docked_bikes).to match_array([bike, broken_bike]) 
    end
end