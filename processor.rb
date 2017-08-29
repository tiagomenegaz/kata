class Processor
  attr_accessor :lines, :primary, :secondary, :output_index
  attr_reader   :result, :spread

  def initialize(lines, ignore, primary:, secondary:, output_index:)
    @result = nil
    @spread = 100000000000
    @ignore = ignore
    @lines  = lines

    @primary      = primary
    @secondary    = secondary
    @output_index = output_index
  end

  def run
    @lines.each do |line|
      next if Processor.invalid?(line)

      max = Processor.line_value_at(line, @primary)
      min = Processor.line_value_at(line, @secondary)
      current_spread = Processor.difference(max, min)

      if (current_spread) < @spread
        @spread = current_spread
        @result = Processor.line_element_at(line, @output_index)
      end
    end
  end

  private

  def self.invalid?(line)
    Processor.line_value_at(line, 0) == 0
  end

  def self.line_element_at(line, position)
    line.split(" ")[position]
  end

  def self.line_value_at(line, position)
    line.split(" ")[position].to_i
  end

  def self.difference(x, y)
    (x - y).abs
  end

end
