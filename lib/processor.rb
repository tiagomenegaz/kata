# The Processor class is responsible for processing the given set of input lines
# and returing the minium spread according to the main indexes

class Processor
  attr_reader :result, :spread, :lines, :primary, :secondary

  def initialize(lines, primary, secondary)
    @result = nil
    @spread = 100000000000
    @lines  = lines

    @primary   = primary
    @secondary = secondary
  end

  def run
    lines.each do |line|
      current_spread = spread_from(line)

      if current_spread < spread
        @spread = current_spread
        @result = line
      end
    end
  end

  private

  def spread_from(line)
    max = line_value_at(line, primary)
    min = line_value_at(line, secondary)
    difference(max, min)
  end

  def line_value_at(line, position)
    line.split(" ")[position].to_i
  end

  def difference(first_number, second_number)
    return unless (first_number.is_a?(Numeric) && second_number.is_a?(Numeric))
    (first_number - second_number).abs
  end

end
