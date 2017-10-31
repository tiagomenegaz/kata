require "simplecov"
require "./../base_configurator"
require "./../configurer"
require "./../formatter"
require "./../printer"
require "./../processor"
require "./../reader"

SimpleCov.start do
  coverage_dir "#{__dir__}/../tmp/coverage"
end

require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use! Minitest::Reporters::DefaultReporter.new(color: true)
