require "./../lib/processor"

elements = File.open("football.dat", "r").map { |line| line }
processor = Processor.new(elements, primary: -4, secondary: -2, output_index: 1)
processor.run
puts "Team is #{processor.result}"
