require_relative "spec_helper"

describe "main.rb with sample file" do

  it "prints 14 to STDOUT" do
    output_for_main.must_equal <<~EOF
    14
    EOF
  end

  def output_for_main
    %x(ruby main.rb)
  end

end
