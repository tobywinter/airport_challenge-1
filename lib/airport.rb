require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes, :weather, :capacity

  DEFAULT_CAPACITY = 30

  def initialize
    @planes = []
    @weather = Weather.new
    @capacity = DEFAULT_CAPACITY
  end

  def land_plane(plane)
    raise "Weather stormy: Unsafe for landing" if stormy?
    raise "Airport at capacity: Unsafe to land" if full?
    # raise "Plane not airborne" unless plane.airborne
    @planes << plane
  end

  def confirm_landing(plane)
    @planes.include?(plane)
  end

  def take_off(plane)
    raise "Weather stormy: Unsafe for take off" if stormy?
    @planes.delete(plane)
    @planes
  end

  def confirm_take_off(plane)
    !@planes.include?(plane)
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

  def full?
    true if @planes.count >= @capacity
  end

private

  def stormy?
    @weather == :stormy ? true : false
  end

end
