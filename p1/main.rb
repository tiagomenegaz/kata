def format(line)
  line.gsub(/[^0-9,.]/, ' ').split[0..2].map(&:to_i)
end

File.open("weather.dat", "r") do |file|
  min_spread = 100
  min_day = nil
  file.each_line do |line|
    elements = format(line)
    next if elements.size != 3 || elements[0] > 31

    if (elements[1] - elements[2]) < min_spread
      min_spread = elements[1] - elements[2]
      min_day = elements[0]
    end
  end
  puts "#{min_day}"
end
