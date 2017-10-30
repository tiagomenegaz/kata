# The Printer class is responsible for printing the output according to its
# configuration

class Printer

  attr_reader :line, :config

  def initialize(line:, config:)
    @line   = line
    @config = config
  end

  def start
    puts "#{find_element}"
  end

  private

  def find_element
    line.split(" ")[config.output_index]
  end

end
