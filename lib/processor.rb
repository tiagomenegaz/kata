# The Processor class is responsible for processing the given set of input lines
# and returing the minium spread according to the main indexes

class Processor
  attr_reader :lines, :indexes

  def initialize(lines:, indexes:)
    @lines   = lines
    @indexes = indexes
  end

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
    max = line_value_at(line_index, indexes.primary)
    min = line_value_at(line_index, indexes.secondary)
    difference(max, min)
  end

  def line_value_at(line_index, position)
    lines[line_index].split(" ")[position].to_i
  end

  def difference(first_number, second_number)
    (first_number - second_number).abs
  end

end
