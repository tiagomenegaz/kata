# The Formatter class is responsible for executing operations to space separeted
# string given a position

class Formatter < BaseConfigurator

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
