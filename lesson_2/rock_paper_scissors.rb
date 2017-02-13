VALID_CHOICES = ["THE ROCK", "THE PAPER", "THE MIGHTY SCISSORS"]

def test_method
  prompt('test_method')
end

def win?(first, second)
  first == "THE ROCK" && second == "THE MIGHTY SCISSORS" ||
    first == "THE PAPER" && second == "THE ROCK" ||
    first == "THE MIGHTY SCISSORS" && second == "THE PAPER"
end

def display_results(player, computer)
  puts "YOU WHO HAVE CHOSEN #{player} ARE QUAKING IN YOUR BOOTIES \
FOR I HAVE CHOSEN #{computer}"
  if win?(player, computer)
    puts "WAIT. U R WINNER BUT U R NOT SPECIAL"
  elsif win?(computer, player)
    puts "THAT MEANS I WIN AGAIN MEATSACK"
  else
    prompt "A TIE. I AM AMBIVALENT."
  end
end

def prompt(message)
  puts("=> #{message}")
end

test_method

choice = ""
loop do # main loop
  loop do
    prompt "WHICH ONE IS IT THAT YOU CHOOSE, MORTAL? \
#{VALID_CHOICES[0...-1].join(', ')}, OR #{VALID_CHOICES.last}?"
    choice = gets.chomp.upcase
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt "UR R DUM. VALID THIS TIME! VALID!"
    end
  end
  computer_choice = VALID_CHOICES.sample
  display_results(choice, computer_choice)
  prompt "AGAIN MEATSACK? X TO EXIT"
  again = gets.chomp.upcase
  if again == "X"
    puts "I'LL MISS YOU"
    break
  end
end
