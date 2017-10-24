File.open("football.dat", "r") do |file|
  team       = nil
  min_spread = 100

  file.each_line do |line|
    elements = line.split(" ")
    next if elements.size != 10 && elements[0][-1] != "."

    diff = (elements[-4].to_i - elements[-2].to_i).abs
    if diff < min_spread
      min_spread = diff
      team = elements[1]
    end
  end
  puts "Team is #{team}"
end
