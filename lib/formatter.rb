class Formatter

  def self.line_element_at(line, position)
    line.split(" ")[position]
  end

  def self.line_value_at(line, position)
    line.split(" ")[position].to_i
  end

  def self.difference(x, y)
    return unless (x.is_a?(Numeric) && y.is_a?(Numeric))
    (x - y).abs
  end

end
