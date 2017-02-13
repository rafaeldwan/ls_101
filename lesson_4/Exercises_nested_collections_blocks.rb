# Lesson 4 > ruby collections > Exercises: Nested Collections and Working with Blocks

#Exercise 1

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
arr1[2][1][3]
arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
arr2[1][:third][0]
arr3 = [['abc'], ['def'], {third: ['ghi']}]
arr3[2][:third][0]
hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
hsh1["b"][1]
hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
hsh2[:third].key(0)


#Exercise 2

arr1 = [1, [2, 3], 4]
arr1[1][1] += 1
arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[2] += 1
hsh1 = {first: [1, 2, [3]]}
hsh1[:first][2][0] += 1
hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[["a"]][:a][2] += 1

# Exercise 4

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}


#vowels = %w(a e i o u y)

hsh.each do |_, array|
  array.each do |string|
    puts string.delete!('^aeiouy')
  end
end

# Exercise 5

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map {|i| i.sort {|a, b| b <=> a}} #originally had arr.each, WATCH IF IT CALLS FOR NEW ARRAY

# Exercise 6

[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hash|
  hash.map {|_, num| num + 1}
end
    
    
# Exercise 7

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.map do |in_array|
  in_array.select {|num| num % 3 == 0}
end


# Exercise 8

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
hsh = {}

arr.each do |sub_arr|
  hsh[sub_arr[0]] = [sub_arr[1]]
end

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]


#Exercise 9

arr.sort_by do |in_arr| 
  oddsum = []
  total = 0
  in_arr.each do |num|
    total += num if num.odd?
    oddsum << total
  end
  oddsum
end
  
# launch school does like - I thought they wanted sorted by the summ of all odds 
# within the array, which mine accomplishes

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

arr.sort_by do |in_arr|
  in_arr.select do |num|
    num.odd?
  end
end

# Exercise 10

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

hsh.map do |produce|
  if produce[1][:type] == "fruit"
    produce[1][:colors]
  else
    produce[1][:size].upcase
  end
end

#oohhhhh I forgot to put in two values for the hash, that's what messed me up
#correct solution from memory. also forgot to capitilize

hsh.map do |_, produce|
  if produce[:type] == "fruit"
    produce[:colors].map do |fruit|
      fruit.capitalize
    end
  else
    produce[:size].upcase
  end
end
    
    
# Exercise 11
    
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]


arr.map do |hash|
  reject = false
  hash.map do |_, array|
    array.each do |value|
      reject = true if value.odd?
    end
  end
  hash if reject == false
end

#returns nil values in the new hash. Given solution from memory:

arr.select do |hash|
  hash.all? do |_, array|
    array.all? do |value|
      value.even?
    end
  end
end


# Exercise 12

arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]
new_arr = []



arr.each do |element|
  if element.is_a?(Array)
    element.each do |next_el|
      if next_el.is_a?(Array)
        next_el.each { |ult_el| new_arr << ult_el}
      else
        new_arr << next_el
      end
    end
  else
    new_arr << element
  end
end
  
