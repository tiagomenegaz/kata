class Processor

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
