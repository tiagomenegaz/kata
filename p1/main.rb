require "./../lib/processor"

elements  = IO.readlines("weather.dat")
config    = Configurer.new(primary: 1, secondary: 2, output_index: 0)
processor = Processor.new(elements, config)
processor.run
puts "#{processor.result}"
