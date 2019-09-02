require_relative 'drivers'
require 'time'

class Trip
  attr_reader :driver_name, :start_time, :end_time, :distance, :duration

  def initialize(driver_name, start_time, end_time, distance)
    @driver_name = driver_name
    @start_time = start_time
    @end_time = end_time
    @distance = distance
    @duration = self.calculate_duration
  end

  # Log a trip to a driver.
  def log_to_driver
    Driver.all.each do |driver_record|
      driver_record.trips << self if driver_record.name == self.driver_name
    end
  end

  # Calculate a trip's duration in hours.
  def calculate_duration
    (Time.parse(@end_time) - Time.parse(@start_time)) / 3600
  end
end
