require "./../lib/processor"
require "./../lib/formatter"
require "./../lib/configurer"
require "./../lib/printer"

config    = Configurer.new(primary: 1, secondary: 2, output_index: 0, reject_index: 0)
raw_lines = IO.readlines("weather.dat")
formatted = Formatter.lines_formatter(raw_lines, config.reject_index)
processor = Processor.new(formatted, config.primary, config.secondary)
processor.run
Printer.start(processor.result, config.output_index)
