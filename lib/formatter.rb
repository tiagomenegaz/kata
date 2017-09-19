# The Formatter class is responsible for executing operations to space separeted
# string given a position

class Formatter

  def self.lines_formatter(lines, reject_index)
    result = []
    lines.each do |line|
      result << line unless Formatter.valid?(line, reject_index)
    end
    result
  end

  private

  def self.valid?(line, reject_index)
    line.split(" ")[reject_index].to_i == 0
  end

end
