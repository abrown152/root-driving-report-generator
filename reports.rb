require './drivers.rb'
require './trips.rb'

class Report
  def initialize
    @file_data = $stdin.read.split(/\n+/).map{ |record| record.split(" ")}
    @drivers = []
    @trips = []
  end

  # Sequencer method that runs through all steps needed to generate a report.
  def generate_report
    self.data_sorter

    @drivers.each do |driver|
      driver.total_duration
      driver.distance_calculator
      driver.average_speed
    end

    self.compile_report
  end

  # Creates instances for drivers and trips.
  def data_sorter
    @file_data.each do |row|
      @trips << Trip.new(row[1], row[2], row[3], row[4]).log_to_driver if row[0] == "Trip"
      @drivers << Driver.new(row[1]) if row[0] == "Driver"
    end
  end

  # Compiles and returns the sorted report
  def compile_report
    sorted_drivers = @drivers.sort_by { |driver| driver.total_distance }
    sorted_drivers.each do |driver|
      if driver.average_speed.to_i >= 5 && driver.average_speed.to_i <= 100
        puts "#{driver.name}: #{driver.total_distance.to_i} miles @ #{driver.average_speed.to_i} mph"
      end
    end
  end

end

Report.new.generate_report
