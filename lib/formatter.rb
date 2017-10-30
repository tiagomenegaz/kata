# The Formatter class is responsible for executing operations to space separeted
# string given a position

class Formatter

  attr_reader :lines, :config

  def initialize(lines, config)
    @lines  = lines
    @config = config
  end

  def formatted_lines
    result = []
    lines.each_with_index do |line, index|
      result << line unless valid?(index)
    end
    result
  end

  private

  def valid?(index)
    lines[index].split(" ")[config.reject_index].to_i == 0
  end

end
