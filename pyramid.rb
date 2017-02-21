puts "*".center(5)
puts "***".center(5)
puts "*****".center(5)
puts "***".center(5)
puts "*".center(5)

puts  "*\n***\n*****\n***\n*".center(5)

def puts_center(length, string)
  puts string.center(length)
end

puts_center 5, "*"
puts_center 5, "***"
puts_center 5, "*****"
puts_center 5, "***"
puts_center 5, "*"

def pyramid(length)
  if length.even?
    puts "need odd!"
  elsif length <= 0
    puts "don't be silly!"
  else
    row_up = length / 2 + 1
    star = 1
    row_up.times do
      puts_center( length, ("*" * star))
      star += 2
    end
    star = length - 2
    row_down = length / 2
    row_down.times do
      puts_center(length, ("*" * star))
      star -= 2
    end
  end
end

pyramid 3
pyramid 7
pyramid 17
pyramid 2
pyramid (-1)
pyramid 51

    

