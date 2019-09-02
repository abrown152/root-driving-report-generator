require "test/unit"
require "../app/drivers.rb"
require "../app/trips.rb"

class TestDriver < Test::Unit::TestCase

  def setup
    @driver = Driver.new("Dan")
    @trip1 = Trip.new("Dan", "06:00", "08:00", "17.3")
    @trip2 = Trip.new("Dan", "12:15", "22:15", "20")
    @trip1.log_to_driver
    @trip2.log_to_driver
  end

  def test_all
    Driver.new("Doug")
    Driver.new("PepperAnn")
    Driver.new("TJ")

    assert_equal(Driver.all.count, 4)
  end

  def test_total_duration
    @driver.total_duration

    assert_equal(@driver.total_driving_time, 12)
  end

  def test_distance_calculator
    @driver.distance_calculator

    assert_equal(@driver.total_distance, 37.3)
  end

  def test_average_speed
    @driver.total_duration
    @driver.distance_calculator

    assert_equal(@driver.average_speed, 3)
  end
end
