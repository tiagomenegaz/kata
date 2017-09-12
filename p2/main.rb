require "./../lib/processor"

elements  = IO.readlines("football.dat")
processor = Processor.new(elements, primary: -4, secondary: -2, output_index: 1)
processor.run
puts "Team is #{processor.result}"
