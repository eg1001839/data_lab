
f=File.new("openairpro.csv","r")
c_air = f.readlines
f.close
split = c_air.collect do |dv|
	split = dv.split(",")
	split[1].to_f
end
length  = split.length
sum = split.inject{|sum,x| sum + x }

mean = sum / length
puts"The mean is"
puts mean
sum = split.inject{|sum2,x| sum2 +( x-mean)**2 }

sd = sum / length
puts "The standard deviation is"
puts sd

v = split.collect do |rv|
        (rv - mean) / sd
end

f = File.new("z_scores.csv","w")
f.puts v
f.close





