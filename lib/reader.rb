# The Reader class is responsible for configuring

class Reader

  attr_reader :file_name

  def initialize(file_name:)
    @file_name = file_name
  end

  def load_lines
    IO.readlines(file_name)
  end

end
