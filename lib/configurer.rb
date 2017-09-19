# The Configurer class is responsible for configuring

class Configurer

  attr_reader :primary, :secondary, :output_index, :reject_index

  def initialize(primary:, secondary:, output_index:, reject_index:)
    @primary      = primary
    @secondary    = secondary
    @output_index = output_index
    @reject_index = reject_index
  end

end
