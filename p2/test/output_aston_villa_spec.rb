require_relative "spec_helper"

describe "main.rb with sample file" do

  it "prints Aston Villa to STDOUT" do
    output_for_main.must_equal <<~EOF
    Aston_Villa
    EOF
  end

  def output_for_main
    %x(ruby main.rb)
  end

end
