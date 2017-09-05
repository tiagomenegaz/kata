require_relative "spec_helper"
require "./formatter"

describe ".line_element_at" do
  it "returns element with line of strings" do
    line     = "a b c"
    position = 1
    Formatter.line_element_at(line, position).must_equal "b"
  end

  it "returns type of element with line of strings" do
    line     = "a b c"
    position = 1
    element  = Formatter.line_element_at(line, position)
    element.class.must_equal "b".class
  end

  it "returns element with line of numbers" do
    line     = "1 2 3"
    position = 1
    Formatter.line_element_at(line, position).must_equal "2"
  end

  it "returns type of element with line of numbers" do
    line     = "1 2 3"
    position = 1
    element  = Formatter.line_element_at(line, position)
    element.class.must_equal "1".class
  end
end

describe ".line_value_at" do
  it "returns default element with invalid data" do
    line     = "a b c"
    position = 1
    Formatter.line_value_at(line, position).must_equal 0
  end

  it "returns type of default element with invalid data" do
    line     = "a b c"
    position = 1
    element  = Formatter.line_value_at(line, position)
    element.class.must_equal Fixnum
  end

  it "returns integer from the line of numbers" do
    line     = "1 2 3"
    position = 1
    Formatter.line_value_at(line, position).must_equal 2
  end

  it "returns integer class from the with line of numbers" do
    line     = "1 2 3"
    position = 1
    element  = Formatter.line_value_at(line, position)
    element.class.must_equal 2.class
  end
end

describe ".difference" do
  it "returns default element with invalid data" do
    Formatter.difference(2, 1).must_equal 1
  end

  it "returns type of default element with invalid data" do
    Formatter.difference(1, 2).must_equal 1
  end

  it "returns integer from the line of numbers" do
    assert_nil Formatter.difference("2", "1")
  end

  it "returns integer class from the with line of numbers" do
    Formatter.difference("2", ".").must_equal nil
  end
end
