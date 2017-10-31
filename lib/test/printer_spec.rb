require_relative "spec_helper"

describe "printer.rb" do
  describe "when creating a new instance" do
    it "returns correct values" do
      line      = "1 2 3 4 5"
      config    = Configurer.new(primary: nil, secondary: nil, output_index: 0, reject_index: nil)
      formatted = Printer.new(line: line, config: config)

      formatted.line.must_equal line
      formatted.config.must_equal config
    end
  end

  describe "#start" do
    it "returns correct values for given configuration" do
      line      = "1 2 3 4 5"
      config    = Configurer.new(primary: nil, secondary: nil, output_index: 1, reject_index: nil)
      formatted = Printer.new(line: line, config: config)

      assert_output(/2/) { formatted.start }
    end

    it "raises error to nil configuration" do
      line      = "1 2 3 4 5"
      config    = Configurer.new(primary: nil, secondary: nil, output_index: 0, reject_index: nil)
      formatted = Printer.new(line: line, config: nil)

      assert_raises NoMethodError do
        formatted.start
      end
    end
  end
end
