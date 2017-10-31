require_relative "spec_helper"

describe "configurer.rb" do
  describe "when creating a new instance" do
    it "returns correct values for integers" do
      config = Configurer.new(primary: 1, secondary: 1, output_index: 1, reject_index: 1)

      config.primary.must_equal 1
      config.secondary.must_equal 1
      config.output_index.must_equal 1
      config.reject_index.must_equal 1
    end

    it "returns correct values for strings" do
      config = Configurer.new(primary: "a", secondary: "1", output_index: "b", reject_index: "2")

      config.primary.must_equal "a"
      config.secondary.must_equal "1"
      config.output_index.must_equal "b"
      config.reject_index.must_equal "2"
    end

    it "returns correct values for nil" do
      config = Configurer.new(primary: nil, secondary: nil, output_index: nil, reject_index: nil)

      config.primary.must_equal nil
      config.secondary.must_equal nil
      config.output_index.must_equal nil
      config.reject_index.must_equal nil
    end
  end
end
