require_relative 'bike'
class DockingStation

DEFAULT_CAPACITY = 20

attr_reader :bike

attr_reader :capacity
attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if @bikes.empty?
    fail 'bike is broken' if @broken == true
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
