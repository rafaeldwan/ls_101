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


#exercise 11

arr = ['10', '11', '9', '7', '8']

arr.sort{|a, b| b.to_i <=> a.to_i}

#exercise 12

books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysees', author: 'James Joyce', published: '1922'}
]

puts books.sort_by {|book| book[:published].to_i}