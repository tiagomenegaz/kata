require "./processor"

File.open("weather.dat", "r") do |file|
  min_spread = 100000000000
  min_day = 0
  file.each_line do |line|
    next if Processor.line_value_at(line, 0) == 0

    max = Processor.line_value_at(line, 1)
    min = Processor.line_value_at(line, 2)
    current_spread = Processor.difference(max, min)

    if (current_spread) < min_spread
      min_spread = current_spread
      min_day    = Processor.line_element_at(line, 0)
    end
  end
  puts "#{min_day}"
end
