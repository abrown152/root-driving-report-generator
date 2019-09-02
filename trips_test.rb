require "test/unit"
require_relative "trips"
require_relative 'drivers'

class TestTrip < Test::Unit::TestCase

  def setup
    @driver = Driver.new("Dan")
    @trip = Trip.new("Dan", "07:15", "07:45", "17.3")
  end

  def test_log_to_driver
    @trip.log_to_driver

    assert_equal(@driver.trips.length, 1)
    assert_equal(@driver.trips[0].distance, "17.3")
    assert_equal(@driver.trips[0].driver_name, "Dan")
    assert_equal(@driver.trips[0].start_time, "07:15")
    assert_equal(@driver.trips[0].end_time, "07:45")
  end

  def test_calculate_duration
    assert_equal(@trip.calculate_duration, 0.5)
  end

end
