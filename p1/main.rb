def day_column(line)
  line.split(" ")[0].to_i
end

def max_column(line)
  line.split(" ")[1].to_i
end

def min_column(line)
  line.split(" ")[2].to_i
end

def valid_row?(line)
  line.split(" ")[0].to_i > 0 &&
    line.split(" ")[0].to_i <= 30 &&
    min_column(line) > 0 &&
    max_column(line) > 0
end

def spread(max_temperature, min_temperature)
  max_temperature - min_temperature
end

file = File.open("weather.dat", "r")

min_spread = 100000000000
min_day = 0

while(line = file.gets)
  line = line.gsub(/[^0-9,.]/, ' ')

  if valid_row?(line)

    min = min_column(line)
    max = max_column(line)

    current_spread = spread(max, min)

    if current_spread < min_spread
      min_spread = current_spread
      min_day    = day_column(line)
    end
  end
end

puts("Min day is #{min_day}")

file.close
