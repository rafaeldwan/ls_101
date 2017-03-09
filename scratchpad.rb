require 'pry'

=begin

NUMBERS = [1, 2, 3]
arr = [1, 2, 3]

def test
  puts NUMBERS.inspect
  puts arr.inspect
end

test



#start
#sets number1
#sets number2

#print number1 + number2

#---
# set [array, of, strings]
# print concatenated.array.of.strings

#--
#SET [array, of, integers]
#SET [empty_array] = Loop through [array_of_integers]
#  skip every other iteration
#END
  
  
def truthy_or_falsey value
  # We don't know what `value` is
  # It could be true, false, or a non-boolean value like 1, "", etc.
  # Ruby only cares about whether something is truthy or falsey, though.
  # Let's go look!

  if value
    # What does inspect do here?
    # Remove it and see how the output changes.
    puts "#{value.inspect} is truthy"

    # Instead of calling value.inspect, call value.to_s
    # How does the output of that look?
  else
    puts "#{value.inspect} is falsey" 
  end
end

[true, false, Object, 0, 1, nil, true, false, "", [1, 2, 3], {}].each do |value|
  truthy_or_falsey(value)
end


def and_op(a,b)
  a && b
end

def or_op(a,b)
  a || b
end

def not_op(a)
  !a
end

def print_and_op(a,b)
  return_value = and_op(a,b)
  if return_value
    puts "#{a.inspect} && #{b.inspect} returns #{return_value.inspect}, which is truthy"
  else
    puts "#{a.inspect} && #{b.inspect} returns #{return_value.inspect}, which is falsey"
  end
end

def print_or_op(a,b)
  return_value = or_op(a,b)
  if return_value
    puts "#{a.inspect} || #{b.inspect} returns #{return_value.inspect}, which is truthy"
  else
    puts "#{a.inspect} || #{b.inspect} returns #{return_value.inspect}, which is falsey"
  end
end

def print_not_op(a)
  return_value = not_op(a)
  if return_value
    puts "!#{a.inspect} returns #{return_value.inspect}, which is truthy"
  else
    puts "!#{a.inspect} returns #{return_value.inspect}, which is falsey"
  end
end

# Let's see how these guys work..
print_and_op(true,1)
print_and_op(true,Object)
print_and_op(true,"")
print_and_op(false, 1)
print_and_op(false, Object)
print_and_op(false, "")
print_and_op(false, false)
print_and_op(nil, false)
print_and_op(false, nil)
print_and_op(false, true)
print_and_op(nil, true)

# Now play around it with || and ! using print_or_op and print_not_op
# Can you come up with a simple rule for what && returns?
# How about || and ! ?

print_or_op(true,1)
print_or_op(true,Object)
print_or_op(true,"")
print_or_op(false, 1)
print_or_op(false, Object)
print_or_op(false, "")
print_or_op(false, false)
print_or_op(nil, false)
print_or_op(false, nil)
print_or_op(false, true)
print_or_op(nil, true)

print_not_op(1)
print_not_op(Object)
print_not_op("")
print_not_op(true)
print_not_op(false)
print_not_op(nil)

hash = {1 => 'foo', 2 => 'bar'}
puts "hash[1] is #{hash[1].inspect}"
puts "hash[2] is #{hash[2].inspect}"
puts "hash[1 && 2] is #{hash[1 && 2].inspect} because 1 && 2 evaluates to 2 and hash[2] is #{hash[2].inspect}"

=end


# Lesson 4, ruby collections, selection and transformation 

=begin

produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}



def select_fruit(food)
  result = {}
  food.each {|i, x| result[i] = x if x == "Fruit"}
  result
end

puts select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

def double_numbers!(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] *= 2
    counter += 1
  end
  puts numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
double_numbers!(my_numbers)
def double_odd_index(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter == numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

my_numbers = [1, 4, 3, 7, 2, 6]
puts double_odd_index(my_numbers)

def multiply (numbers, multiplier)
  result = []
  counter = 0
  numbers.length.times do
    result << numbers[counter] * multiplier
    counter += 1
  end
  result
end
puts multiply(my_numbers, 3)

arr = [['a', ['b']], {b: 'bear', c: 'cat' }, 'cab']
binding.pry

=begin

Example 1

An multi-dimensional array of two arrays is passed to the #each method, which loops the contained
the inner arrays one at a time as arguments (meanin it assigns them as local variable) to its block and then stops. The block runs 
the argument through the #first method, which returns the first element(the object at index 0) of the
argument array to the puts method, which outputs the string value of the integer to the screen. The each loop 
then outputs nil, which is the value of "puts". ##Since nil does not modify anything.
the method returns the original array.### #each doesn't do anything with the return
value. since the return value of .each is the calling object, this is what is
returned. 

Example 3:

Multidimensionaal array passed to #map function, which passes each sub-array to 
its block.  The block first runs each argument through the #first method, which returns the object with index(0) of the sub-array to the .puts method, which converts the integer to a string and hands it to STOUT. The block the runs the #first method again, and returns it to the map function, which returns both values as a new array. 

Line |     Action    |       Object      |Side Effect| Return Value|  Used?

1       #map method        outer Array              no    new Array    no
2-4    block           each inner array   no            elemenent at      
       execution                                        index(0) of
                                                        each sub-array
2       .first method   each inner array  no            element at      yes, by
                                                        index(0) of      puts
                                                        each sub-array
2.      .puts method      return value      outputs
                            of .first       an integer    nil             no
3.      .first method   each inner array  no            element at      yes, by
                                                        index(0) of      block
                                                        each sub-array
                                                        
#ok, doing the next one in onenote so I can actuall tables



=end

require "SecureRandom"

def uuid_gen
  SecureRandom.hex(4) + "-"  + SecureRandom.hex(2) + "-" + SecureRandom.hex(2) + "-" + SecureRandom.hex(2) + "-" + SecureRandom.hex(6)
end

uuid_gen

def sequence (count, start)
  result = []
  multiply_by = 1
  count.times do
    result << start * (count * multiply_by)
    multiply_by += 1
  end
  result
end



# Write a method that takes a positive integer as an argument and 
# returns that number with its digits reversed. Examples:

# reversed_number(12345) == 54321
# reversed_number(12213) == 31221
# reversed_number(456) == 654
# reversed_number(12000) == 21 # Note that zeros get dropped!
# reversed_number(1) == 1

input: positive int
return: number with digits reversed

int to string, string to array? string reverse

def reversed_number(int)
  int.to_s.reverse.to_i
end
  
  

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be
greater than the length of the longest side, and all sides must have lengths 
greater than 0: if either of these conditions is not satisfied, the triangle is 
invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
 and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending
  on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

Given: length of three sides of triange
Return: symbol :equilatera, :isoceles :scalene or :invalid
Rules: Valid: two shortest sides sum must be greater than longest side, all sides greater
than 0
Equilateral: all 3 equal
Isoceles: 2 equal
Scalene: all different


test for zero
test for min+min+max > max
return invalid if either true
test for isoceles
test for scalene
else scalene
  
def triangle(side1, side2, side3)
  tri_array = [side1, side2, side3]
  return :invalid if tri_array.include?(0)
  largest = tri_array.sort!.pop
  return :invalid if largest > tri_array.sum
  if side1 == side2 && side1 == side3
    return :equilateral 
  elsif side1 != side2 && side1 != side3
    return :scalene 
  end 
  return :isosceles
end

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

\Write a method named include? that takes an Array and a search value as 
arguments. This method should return true if the search value is in the array, 
false if it is not. You may not use the Array#include? method in your solution.

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false


given, array, value

return: boolean, true if value is in array
rules: no array.include

iterate through, return true if conditions

def include?(array, arg)
  array.any? { |i| i == arg }
end

color = "purple"

loop do |cr|
  color = "orange"
  break
end

puts color

def shout(string)
  string << '!!!'
  string.upcase!
end

sentence = 'hello world'
shout(sentence)

letters_and_numbers = {'a' => 1, 'b' => 2, 'c' => 3}

hsh = letters_and_numbers.each do |letter, num|
  p num + 5
end

hsh = {}

letters_and_numbers.each do |letter, num|
  hsh[letter] = num < 4
end

letters_and_numbers = {'a' => 1, 'b' => 2, 'c' => 3}

hsh = letters_and_numbers.select do |letter, num|
  num > 4
end

p hsh

# Write a method that takes an array of strings, and returns an array of 
# the same string values, except with the vowels (a, e, i, o, u) removed.

# remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

# given: arr of strings string
# return: string with vowels removed

# gsub with regex should do

def remove_vowels(arr)
  arr.each { |string| string.gsub!(/[aeiou]/i, "") }
end

def remove_vowels(arr)
  arr.map { |string| string.gsub(/[aeiou]/i, "") }
end


Write a method that searches for all multiples of 3 or 5 that lie between 1 
and some other number, and then computes the sum of those multiples. For 
instance, if the supplied number is 20, the result should be 
98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.


multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168


given: a number n
return: sum of numbers between 1 and n that are multiples of 3 or 5

use modulus and sum

def multisum(n)
  (1..n).select { |num| num % 5 == 0 || num % 3 == 0 }.sum
end


"8 * 4"

def bubble_sort!(arr)
  i = 0
  skipped = 0
  skip_and_break = arr.length - 1
  loop do
    if arr[i] > arr[i+1]
      arr[i], arr[i + 1] = arr[i+1], arr[i]
      skipped = 0
      i += 1
      skip_and_break -= 1 if skip_and_break == i
    else
      i += 1
      skipped += 1
    end
    
    break if skip_and_break == 1
    i = 0,  skipped = 0 if skipped == skip_and_break
  end
end



def bubble_sort!(arr)
  i = 0
  skipped = 0
  new_arr = []
  loop do
    if arr[i] > arr[i+1]
      arr[i], arr[i + 1] = arr[i+1], arr[i]
      skipped = 0
      i += 1
    else
      i += 1
      skipped += 1
    end
    binding.pry
    if skipped == arr.length - 1
      (arr << arr_new).flatten
      break 
    end
    if i == arr.length - 1
      i = 0 && skipped = 0 
      new_arr << arr.pop
    end
  end
end
