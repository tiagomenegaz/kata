def f_column(line)
  line.split(" ")[-4].to_i
end

def a_column(line)
  line.split(" ")[-2].to_i
end

def team_name_column(line)
  line.split(" ")[1]
end

def valid_row?(line)
  line.split(" ").size == 10 && line.split[0][-1] == "."
end

def difference(f, a)
  (f - a).abs
end

file = File.open("football.dat", "r")

min_difference = 100000000000
team = ""

while(line = file.gets)
  if valid_row?(line)

    f_col = f_column(line)
    a_col = a_column(line)

    current_difference = difference(f_col, a_col)

    if current_difference < min_difference
      min_difference = current_difference
      team = team_name_column(line)
    end
  end
end

puts("Team is #{team}")

file.close
