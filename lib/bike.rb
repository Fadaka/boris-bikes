class Bike
  attr_reader :working
  
  def initialize(working = true)
    @working = working
  end

  def working?
    @working 
  end

  def rep_broken_bike
    @working = false
  end
end