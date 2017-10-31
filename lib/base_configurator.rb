# The BaseConfigurator class is responsible for executing operations to space separeted
# string given a position

class BaseConfigurator

  attr_reader :lines, :config

  def initialize(lines:, config:)
    @lines  = lines
    @config = config
  end

end
