require 'bike'

describe Bike do
  it 'tests if bike is working' do
    bmx = Bike.new
    expect(bmx).to respond_to(:working?)
  end
end