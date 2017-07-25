File.open("weather.dat", "r") do |file|
  min_spread = 100000000000
  min_day = 0
  file.each_line do |line|
    elements = line.gsub(/[^0-9,.]/, ' ').split[0..2].map(&:to_i)
    next if elements.size != 3 || elements[0] > 31

    if (elements[1] - elements[2]) < min_spread
      min_spread = elements[1] - elements[2]
      min_day = elements[0]
    end
  end
  puts "#{min_day}"
end
