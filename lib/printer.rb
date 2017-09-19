# The Printer class is responsible for printing the output according to its
# configuration

class Printer

  def self.start(line, output_index)
    puts "#{Printer.find_element(line, output_index)}"
  end

  private

  def self.find_element(line, output_index)
    line.split(" ")[output_index]
  end

end
