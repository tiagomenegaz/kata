# The Processor class is responsible for processing the given set of input lines
# and returing the minium spread according to the main config

class Processor

  attr_reader :lines, :primary, :secondary

  def initialize(lines, primary:, secondary:)
    @lines = lines

    @primary      = primary
    @secondary    = secondary
  end


  def run
    result, spread = initialize_values

    lines.each_with_index do |line, index|
      current_spread = spread_from(index)

      if current_spread < spread
        spread = current_spread
        result = line
      end
    end
    result
  end

  private

  def initialize_values
    [ nil, 100000000000 ]
  end

  def spread_from(index)
    max = line_value_at(index, primary)
    min = line_value_at(index, secondary)
    (max - min).abs
  end

  def line_value_at(index, position)
    lines[index].split(" ")[position].to_i
  end

end
