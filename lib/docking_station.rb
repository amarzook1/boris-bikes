require_relative 'bike'

class DockingStation
  
  DEFAULT_CAPACITY = 20
  
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end
  
  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end
  
  def dock(bike)
    fail 'Docking Station Full!' if full?
    @bikes << bike
  end
  
  attr_reader :bikes,:capacity
  
  private
  
  def full?
    @bikes.count >= @capacity
  end
  
  def empty?
    @bikes.empty?
  end
end