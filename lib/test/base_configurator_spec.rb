require_relative "spec_helper"

describe "base_configurator.rb" do
  describe "when creating a new instance" do
    it "returns correct values for nil" do
      lines  = nil
      config = nil
      base = BaseConfigurator.new(lines: lines, config: config)

      base.lines.must_equal nil
      base.config.must_equal nil
    end

    it "returns correct values for array of strings" do
      lines  = ["1", "2", "3", "4", "5"]
      config = ["1", "2", "3", "4", "5"]
      base = BaseConfigurator.new(lines: lines, config: config)

      base.lines.must_equal lines
      base.config.must_equal config
    end

    it "returns correct values for array of integers" do
      lines  = [1, 2, 3, 4, 5]
      config = [1, 2, 3, 4, 5]
      base = BaseConfigurator.new(lines: lines, config: config)

      base.lines.must_equal lines
      base.config.must_equal config
    end

    it "returns correct values for integers" do
      lines  = 1
      config = 1
      base = BaseConfigurator.new(lines: lines, config: config)

      base.lines.must_equal lines
      base.config.must_equal config
    end

    it "returns correct values for strings" do
      lines  = "a"
      config = "b"
      base = BaseConfigurator.new(lines: lines, config: config)

      base.lines.must_equal lines
      base.config.must_equal config
    end
  end
end
