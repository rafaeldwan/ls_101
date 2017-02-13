### LS 101 / Lesson 3 / Exercises: Medium 1

# Question 1

10.times {|i| puts "#{" " * (i+1)} Rick and Morty is some quality entertainment!"}

# Question 2

# puts "the value of 40 + 2 is " + (40 + 2) # - ways to fix - .to_i or interpolation

# Question 3

def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
  # or number.times dZ
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
  end
  divisors
end

puts factors(3)
puts factors(1)
puts factors(0)
puts factors(-1)

# Question 4

# + doesn't mutate the caller

# Question 5



def fib(first_num, second_num)
  limit = 15
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1)
puts "result is #{result}"


# Question 6


def tricky_method(a_string_param, an_array_param)
  a_string_param.concat " rutabaga"
  an_array_param.push "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"


# Question 


