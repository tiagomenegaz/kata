require "./../lib/processor"

elements  = File.open("weather.dat", "r").map { |line| line }
processor = Processor.new(elements, primary: 1, secondary: 2, output_index: 0)
processor.run
puts "#{processor.result}"
