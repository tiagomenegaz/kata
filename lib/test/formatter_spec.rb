require_relative "spec_helper"

describe "formatter.rb" do
  describe "when creating a new instance" do
    it "returns correct values" do
      lines  = [
        "1 2 3 4 5",
        "1 2 3 4 5",
        "1 2 3 4 5",
        "1 2 3 4 5",
      ]
      config = Configurer.new(primary: nil, secondary: nil, output_index: nil, reject_index: 0)
      base = Formatter.new(lines: lines, config: config)

      base.lines.must_equal lines
      base.config.must_equal config
    end
  end

  describe "#formatted_lines" do
    it "returns correct values for complete matrix" do
      lines  = [
        "1 2 3 4 5",
        "1 2 3 4 5",
        "1 2 3 4 5",
        "1 2 3 4 5",
      ]
      config = Configurer.new(primary: nil, secondary: nil, output_index: nil, reject_index: 0)
      base = Formatter.new(lines: lines, config: config)

      base.formatted_lines.must_equal lines
    end

    it "returns correct values for errors in matrix" do
      lines  = [
        "x 2 3 4 5",
        "1 2 3 4 5",
        "y 2 3 4 5",
        "1 z 3 4 5",
      ]
      config = Configurer.new(primary: nil, secondary: nil, output_index: nil, reject_index: 0)
      base = Formatter.new(lines: lines, config: config)

      base.formatted_lines.must_equal ["1 2 3 4 5", "1 z 3 4 5"]
    end
  end
end
