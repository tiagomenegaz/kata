def get_day(line)
  line.split(" ")[0].to_i
end

def get_min(line)
  line.split(" ")[1].to_i
end

def get_max(line)
  line.split(" ")[2].to_i
end

def valid_line?(line)
  line.split(" ")[0].to_i != 0
end

def spread(min_temperature, max_temperature)
  max_temperature - min_temperature
end

file = File.open("weather.dat", "r")

min_spread = 100000000000
min_day = 0

while(line = file.gets)
  puts("x"*50)

  if valid_line?(line)

    day = get_day(line)
    min = get_min(line)
    max = get_max(line)

    current_spread = spread(min, max)

    if current_spread < min_spread
      min_day = day
    end

    puts(line)
  end
end

puts(day)

file.close
