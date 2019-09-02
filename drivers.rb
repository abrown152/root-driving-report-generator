require './trips.rb'

class Driver
  @@all_drivers = []
  attr_reader :name, :trips, :total_driving_time, :total_distance, :average_speed

  def initialize(name)
    @name = name
    @trips = []
    @total_driving_time = 0
    @total_distance = 0
    @average_speed = 0
    @@all_drivers << self
  end

  # Return a list of all Driver instances
  def self.all
    @@all_drivers
  end

  # Calculate a driver's total drive time.
  def total_duration
    running_total = 0
    @trips.each do |trip|
      @total_driving_time += trip.duration
    end
  end

  # Calculate a driver's total distance.
  def distance_calculator
    @trips.each do |trip|
      @total_distance += trip.distance.to_f
    end
  end

  # Calculate a driver's average speed across all trips.
  def average_speed
    unless (@total_distance == 0) || (@total_driving_time == 0)
      @average_speed = (@total_distance / @total_driving_time).round
    end
  end
end
