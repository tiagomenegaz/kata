require_relative "spec_helper"

describe "reader.rb" do
  it "returns correct values" do
    file_name = "file.dat"
    base   = Reader.new(file_name: file_name)

    base.file_name.must_equal file_name
  end

  describe "#load_lines" do
    it "returns correct values" do
      file_name = "text.txt"
      base   = Reader.new(file_name: file_name)

      base.load_lines.must_equal <<~EOF
      \"[TextHere
      ]
      "
      EOF
    end
  end
end
