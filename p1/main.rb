# File.readlines("weather.dat")[2..-2].map(&:split).map { |line| { day: line[0], spread: line[1].to_i - line[2].to_i } }.min { |a, b| a[:spread] <=> b[:spread] }
# File.readlines("weather.dat")[2..-2].map { |line| line.split[0..2].map(&:to_i) }.min { |(_, amax, amin), (_, bmax, bmin)| (amax - amin) <=> (bmax - bmin) }

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

def spread(max_temperature, min_temperature) # METHOD SHOULD NOT HAVE TEMPERATURE
  max_temperature - min_temperature
end

file = File.open("weather.dat", "r") # OPEN USING BLOCK

min_spread = 100000000000
min_day = 0

while(line = file.gets)
  line = line.gsub(/[^0-9,.]/, ' ')

  if valid_row?(line) # START FROM 2nd LINE - LOAD ON MEMORY

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
