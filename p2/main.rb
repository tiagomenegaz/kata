require "./processor"

File.open("football.dat", "r") do |file|
  min_spread = 100000000000
  team = ""
  file.each_line do |line|
    next if line.split(' ').size != 10

    for_goal   = Processor.line_value_at(line, -4)
    for_againt = Processor.line_value_at(line, -2)
    diff       = Processor.difference(for_goal, for_againt)

    if diff < min_spread
      min_spread = diff
      team = Processor.line_element_at(line, 1)
    end
  end
  puts "Team is #{team}"
end
