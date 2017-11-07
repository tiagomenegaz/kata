# The FileReader class is responsible for configuring

class FileReader

  attr_reader :file_name, :reject_index

  def initialize(file_name, reject_index:)
    @file_name    = file_name
    @reject_index = reject_index
  end

  def formatted_lines
    lines  = IO.readlines(file_name)
    result = []
    lines.each { |line| result << line if valid?(line) }
    result
  end

  private

  def valid?(line)
    line.split(" ")[reject_index].to_i != 0
  end

end
