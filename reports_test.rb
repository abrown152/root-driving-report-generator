require "test/unit"
require_relative "reports"
require "./reports.rb"

class TestReport < Test::Unit::TestCase

  def setup
    root_test_input = [["Driver", "Dan"], ["Driver", "Alex"], ["Driver", "Bob"], ["Trip", "Dan", "07:15", "07:45", "17.3"], ["Trip", "Dan", "06:12", "06:32", "21.8"], ["Trip", "Alex", "12:01", "13:16", "42.0"]]
    @report = Report.new(root_test_input)
  end

  def test_generate_report
    assert_instance_of(Array, @report.generate_report)
    assert_equal(@report.generate_report.length, 6)
  end

  def test_data_sorter
    @report.data_sorter
    assert_instance_of(Array, @report.trips)
    assert_instance_of(Array, @report.drivers)
    assert_equal(@report.trips.length, 3)
    assert_equal(@report.drivers.length, 3)
  end

  def test_compile_report
    assert_equal(@report.compile_report.class, String)
  end

end
