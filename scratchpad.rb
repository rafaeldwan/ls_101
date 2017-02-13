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





