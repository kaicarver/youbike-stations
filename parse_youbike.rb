youbike = File.read "Youbike.txt"
youbi = youbike.split "|"
you = youbi.map do |y|
  x = y.split "_"
  print x[0], " ", x[1],"\n"
end
