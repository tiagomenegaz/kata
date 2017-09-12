# The Formatter class is responsible for executing operations to space separeted
# string given a position

class Formatter

  def self.line_element_at(line, position)
    line.split(" ")[position]
  end

  def self.line_value_at(line, position)
    line.split(" ")[position].to_i
  end

  def self.difference(first_number, second_number)
    return unless (first_number.is_a?(Numeric) && second_number.is_a?(Numeric))
    (first_number - second_number).abs
  end

end
