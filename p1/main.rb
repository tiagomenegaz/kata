require "./../lib/base_configurator"
require "./../lib/configurer"
require "./../lib/reader"
require "./../lib/processor"
require "./../lib/formatter"
require "./../lib/printer"

config    = Configurer.new(primary: 1, secondary: 2, output_index: 0, reject_index: 0)
raw_lines = Reader.new(file_name: "weather.dat").load_lines
formatted = Formatter.new(lines: raw_lines, config: config).formatted_lines
line      = Processor.new(lines: formatted, config: config).run
printer   = Printer.new(line: line, config: config)
printer.start
