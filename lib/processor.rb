require_relative "formatter"
require_relative "configurer"

# The Processor class is responsible for processing the given set of input lines
# and returing the minium spread according to the main indexes
class Processor
  attr_reader :result, :spread, :lines, :configuration

  def initialize(lines, configuration)
    @result = nil
    @spread = 100000000000
    @lines  = lines

    @configuration = configuration
  end

  def run
    lines.each do |line|
      next if Processor.invalid?(line)

      current_spread = spread_from(line)

      if current_spread < @spread
        @spread = current_spread
        @result = Formatter.line_element_at(line, configuration.output_index)
      end
    end
  end

  private

  def self.invalid?(line)
    Formatter.line_value_at(line, 0) == 0
  end

  def spread_from(line)
    max = Formatter.line_value_at(line, configuration.primary)
    min = Formatter.line_value_at(line, configuration.secondary)
    Formatter.difference(max, min)
  end

end
