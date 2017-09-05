require_relative "spec_helper"
require "./processor"

describe ".run" do
  it "sets result value with empty lines" do
    proc = Processor.new([], primary: 0, secondary: 0, output_index: 0)
    proc.run
    assert_nil proc.result
  end

  it "sets result value with invalid lines" do
    lines = [
      "a b c",
      "a b c",
      "a b c",
    ]
    proc = Processor.new(lines, primary: 0, secondary: 1, output_index: 2)
    proc.run
    assert_nil proc.result
  end

  it "sets result value with valid lines" do
    lines = [
      "2 1 c",
      "d e f",
      "g h i",
    ]
    proc = Processor.new(lines, primary: 0, secondary: 1, output_index: 2)
    proc.run
    proc.result.must_equal "c"
  end

  it "sets result value with valid lines" do
    lines = [
      "20 1 c",
      "3 0 f",
      "g h i",
    ]
    proc = Processor.new(lines, primary: 0, secondary: 1, output_index: 2)
    proc.run
    proc.result.must_equal "f"
  end

  it "sets result value with invalid params" do
    lines = [
      "20 1 c",
      "3 0 f",
      "g h i",
    ]
    proc = Processor.new(lines, primary: 0, secondary: 1, output_index: -20)
    proc.run
    assert_nil proc.result
  end

end
