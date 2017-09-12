# The Configurer class is responsible for configuring

class Configurer

  attr_reader :primary, :secondary, :output_index

  def initialize(primary:, secondary:, output_index:)
    @primary      = primary
    @secondary    = secondary
    @output_index = output_index
  end

end
