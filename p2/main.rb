def get_day(line)
  line.split(" ")[0].to_i
end

def get_max(line)
  line.split(" ")[1].to_i
end

def get_min(line)
  line.split(" ")[2].to_i
end

def valid_line?(line)
  line.split(" ")[0].to_i > 0 &&
    line.split(" ")[0].to_i <= 30 &&
    get_min(line) > 0 &&
    get_max(line) > 0
end

def spread(max_temperature, min_temperature)
  max_temperature - min_temperature
end

file = File.open("weather.dat", "r")

min_spread = 100000000000
min_day = 0

while(line = file.gets)
  line = line.gsub(/[^0-9,.]/, ' ')

  if valid_line?(line)

    min = get_min(line)
    max = get_max(line)

    current_spread = spread(max, min)

    if current_spread < min_spread
      min_spread = current_spread
      min_day    = get_day(line)
    end
  end
end

puts("Min day is #{min_day}")

file.close
