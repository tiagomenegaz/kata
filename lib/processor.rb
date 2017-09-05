require_relative "formatter"

class Processor
  attr_accessor :lines, :primary, :secondary, :output_index
  attr_reader   :result, :spread

  def initialize(lines, primary:, secondary:, output_index:)
    @result = nil
    @spread = 100000000000
    @lines  = lines

    @primary      = primary
    @secondary    = secondary
    @output_index = output_index
  end

  def run
    @lines.each do |line|
      next if invalid?(line)

      max = Formatter.line_value_at(line, @primary)
      min = Formatter.line_value_at(line, @secondary)
      current_spread = Formatter.difference(max, min)

      if current_spread < @spread
        @spread = current_spread
        @result = Formatter.line_element_at(line, @output_index)
      end
    end
  end

  private

  def invalid?(line)
    Formatter.line_value_at(line, 0) == 0
  end

end
