# Driving Report Generator

This program consumes a `.txt` file of driver and trip data and returns a driving history report based on driver sorted by most to least total miles driven. Drivers with no valid trips will not be included in the generated report.

You can view the full problem statement [here](https://gist.github.com/dan-manges/1e1854d0704cb9132b74).

### How To Run:

To use the generator, run the following command from the `root-driving-report-generator` directory in your terminal:

```cat root_input.txt | ruby ./app/reports.rb```

To run the tests, run the following commands from the `root-driving-report-generator/test` directory in your terminal:

```ruby drivers_test.rb```

```ruby trips_test.rb```

### Notes on My Approach

- I took an object-oriented approach as this problem easily lends itself to this paradigm. I could instantly recognize the "nouns" and "verbs" in this problem. The nouns(classes) are reports, drivers, and trips. Each of these has its own set of actions (methods) that it needs to perform in order to generate the report.


 - The code is written as though the data has already been scrubbed. Typically I would write logic to ensure the data is standardized and corresponding tests, however the code sample instructions made it pretty clear that I should not give much attention to edge cases.


- Used attr_reader instead of attr_accessor as an low-effort way to keep object permissions tight. This makes for cleaner, more maintainable code and reinforces the object-oriented modeling.


- I chose to parse the `start_time` and `end_time` values inline so as to leave the data as true as possible. (Never know what the future holds!)


- I rounded the `total_distance` on output instead of on calculation so `average_speed` could be calculated using the more accurate float value.


- I considered using a testing framework like RSpec but decided against it as the code reviewer may not have it installed and I always appreciate not having to do any yak shaving when reviewing code samples. I also considered building this out as a Rails app but thought that was a bit heavy for the ask. Would've been fun though! :)


### How I Would Refactor:
- Add some logic for standardizing the data (just in case!)
- Add some helpful error-handling.
- Write more robust tests.
- Improve latency.
- I'd like to make sure the `trips` attribute in the `Driver` class is storing a reference to the `trips` instances rather than the actual data. If it's not, I'd design a leaner approach.
