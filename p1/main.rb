require "./../lib/configurer"
require "./../lib/reader"
require "./../lib/processor"
require "./../lib/formatter"
require "./../lib/printer"

config    = Configurer.new(primary: 1, secondary: 2, output_index: 0, reject_index: 0)
raw_lines = Reader.new(file_name: "weather.dat").load_lines
formatted = Formatter.new(raw_lines, config).formatted_lines
processor = Processor.new(formatted, config)
printer   = Printer.new(line: processor.run, config: config)
printer.start
