# Lesson 4 > ruby collections > Exercises: Additional Practice

# Exercise 1

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones.each_with_index.to_h


# Exercise 2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.sum # only works 2.4 and above

ages.values.inject(:+)


# Exercise 3

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

ages.reject! {|_, age| age >= 100}


# Exercise 4

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.sort.first

ages.values.min


# Exercise 5

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.bsearch_index {|element| element.start_with? "Be"}

# ls's is probably better, from memory:

flintstones.index {|name| name[0..1] == "Be"}

flintstones.index {|name| name[0, 2] == "Be"}

# hybrid:

flintstones.bsearch_index {|element| element[0, 2] == "Be"}
flintstones.index {|name| name.start_with? ("Be")}


# Exercise 6

flintstones.map! {|name| name[0..2]}
  
  
# Exercise 7

statement = "The Flintstones Rock"

letters = statement.downcase.chars

letter_counts = Hash.new

letters.each do |letter|
  unless letter == " "
    if letter_counts[letter]
      letter_counts[letter] += 1
    else
      letter_counts[letter] = 1
    end
  end
end


# Exercise 8

words = "the flintstones rock"

def titleize(phrase)
  breakdown = phrase.split
  breakdown.map! {|word| word.capitalize}
  breakdown.join(" ")
end

words = titleize(words)

#sexier, as given, from memory:

words = "the flintstones rock"

def titleizer(phrase)
  phrase.split.map{|word| word.capitalize}.join(" ")
end

titleizer(words)


# Exercise 10

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, hsh| 
  case hsh["age"]
  when 0..18 then hsh["age_group"] = "Child"
  when 19..65 then hsh["age_group"] = "Adult"
  else 
    hsh["age_group"] = "Elder"
  end
end