Currently written as though data has already been scrubbed

Used attr_reader instead of attr_accessor to keep object permissions as tight as possible

Parsing time inline so as to leave the data as true as possible

Rounding the total miles on output instead of on calculation so speed can be calculated using the more accurate float value

How I Would Refactor:
- Would get rid of nested loop in compile_report method
