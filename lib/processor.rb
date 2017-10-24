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

    lines.each do |line|
      current_spread = spread_from(line)

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

  def spread_from(line)
    max = line_value_at(line, indexes.primary)
    min = line_value_at(line, indexes.secondary)
    difference(max, min)
  end

  def line_value_at(line, position)
    line.split(" ")[position].to_i
  end

  def difference(first_number, second_number)
    (first_number - second_number).abs
  end

end
