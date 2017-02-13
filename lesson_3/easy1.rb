### LS 101 / Lesson 3 / Exercises: Easy 1

advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!("important", "urgent")

puts advice

(10..100).include?(42)

(10..100).cover?(42)

def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
p eval(how_deep)
modern_stone_age_family = ["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]
modern_stone_age_family.flatten!
p modern_stone_age_family

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones = flintstones.keep_if {|i, _| i == "Barney"}
p flintstones
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.select! {|i, _| i == "Barney"}
p flintstones
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
flintstones.assoc("Barney")
p flintstones