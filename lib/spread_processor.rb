require_relative "file_reader"
require_relative "processor"
require_relative "printer"

# The SpreadProcessor class is responsible for processing the given set of input lines
# and returing the minium spread according to the main config

class SpreadProcessor
  attr_reader :file_name, :config

  def initialize(file_name, config:)
    @config    = config
    @file_name = file_name
  end

  def run
    processed_lines = build_actions
    min_spread = run_processor(processed_lines)
    output_result(min_spread)
  end

  private

  def build_actions
    FileReader.new(file_name, reject_index: config.reject_index).formatted_lines
  end

  def run_processor(lines)
    Processor.new(lines, primary: config.primary, secondary: config.secondary).run
  end

  def output_result(result_line)
    Printer.new(result_line, output_index: config.output_index).start
  end

end
