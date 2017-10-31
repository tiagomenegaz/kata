require_relative "spec_helper"

describe "processor.rb" do
  it "returns correct values" do
    lines  = [
      "1 2 3 4 5",
      "1 2 3 4 5",
      "1 2 3 4 5",
      "1 2 3 4 5",
    ]
    config = Configurer.new(primary: 1, secondary: 2, output_index: nil, reject_index: nil)
    base   = Processor.new(lines: lines, config: config)

    base.lines.must_equal lines
    base.config.must_equal config
  end

  describe "#run" do
    it "returns correct values for complete matrix" do
      lines  = [
        "1 2 3 4 5",
        "1 2 3 4 5",
        "1 2 3 4 5",
        "1 2 3 4 5",
      ]
      config = Configurer.new(primary: 1, secondary: 2, output_index: nil, reject_index: nil)
      base   = Processor.new(lines: lines, config: config)

      base.run.must_equal "1 2 3 4 5"
    end

    it "returns correct values for errors in matrix" do
      lines  = [
        "x 2 3 4 5",
        "1 2 3 4 5",
        "y 2 3 4 5",
        "1 z 3 4 5",
      ]
      config = Configurer.new(primary: 1, secondary: 2, output_index: nil, reject_index: nil)
      base   = Processor.new(lines: lines, config: config)

      base.run.must_equal "x 2 3 4 5"
    end

    it "raises error for errors in configurer" do
      lines  = ["x 2 3 4 5"]
      config = Configurer.new(primary: 1, secondary: nil, output_index: nil, reject_index: nil)
      base   = Processor.new(lines: lines, config: config)

      assert_raises TypeError do
        base.run
      end
    end

    it "raises error for nil configurer" do
      lines  = ["x 2 3 4 5"]
      base   = Processor.new(lines: lines, config: nil)

      assert_raises NoMethodError do
        base.run
      end
    end
  end
end
