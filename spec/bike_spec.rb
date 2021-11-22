require 'bike'

describe Bike do
  it 'tests if bike is working' do
    bmx = Bike.new
    expect(bmx).to respond_to(:working?)
  end

  it 'default working condition should be working(true)'do
    bmx = Bike.new
    expect(bmx.working?).to be(true)
  end

  it 'should be able to report a broken bike' do
    bmx = Bike.new
    bmx.rep_broken_bike
    expect(bmx.working?).to be(false)
  end
end