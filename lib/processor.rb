# The Processor class is responsible for processing the given set of input lines
# and returing the minium spread according to the main config

class Processor < BaseConfigurator

  def run
    result, spread = initialize_values

    lines.each_with_index do |line, line_index|
      current_spread = spread_from(line_index)

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

  def spread_from(line_index)
    max = line_value_at(line_index, config.primary)
    min = line_value_at(line_index, config.secondary)
    difference(max, min)
  end

  def line_value_at(line_index, position)
    lines[line_index].split(" ")[position].to_i
  end

  def difference(first_number, second_number)
    (first_number - second_number).abs
  end

end
