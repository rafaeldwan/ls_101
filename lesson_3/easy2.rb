### LS 101 / Lesson 3 / Exercises: Easy 2


# 1)

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

puts ages.include?("Spot")
puts ages.has_key?("Spot")
puts ages.key?("Spot")
puts ages.member?("Spot")

# 2)

munsters_description = "The Munsters are creepy in a good way."

puts munsters_description
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# 3)

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

puts ages.merge!(additional_ages)

advice = "Few things in life are as important as house training your pet dinosaur."

# 4) 

puts advice.include?("Dino")
puts advice.match("Dino")

# 5)

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# 6)

puts flintstones.push "Dino"

# 7) 
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

puts flintstones << "Dino", "Hoppy"

# 8)

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice!(0..-34)
puts advice

advice = "Few things in life are as important as house training your pet dinosaur."

puts advice.slice(0, advice.index("house"))
puts advice

# 9)

statement = "The Flintstones Rock!"

puts statement.count("t")

# 10)

title = "Flintstone Family Members"
puts title.center(40)