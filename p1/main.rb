require "./../lib/spread_processor"
require "./../lib/configurer"

config    = Configurer.new(primary: 1, secondary: 2, output_index: 0, reject_index: 0)
processor = SpreadProcessor.new("weather.dat", config: config)
processor.run

###
# input -> |processor| -> output
# input -> |(read file, assign configurations) -> |proccess content| -> print result| -> output
# input -> |(read file, assign configurations) -> |prepare content -> find min spread| -> print result| -> output
