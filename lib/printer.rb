# The Printer class is responsible for printing the output according to its
# configuration

class Printer

  attr_reader :line, :output_index

  def initialize(line, output_index:)
    @line   = line
    @output_index = output_index
  end

  def start
    puts "#{find_element}"
  end

  private

  def find_element
    line.split(" ")[output_index]
  end

end
