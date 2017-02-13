VALID_CHOICES = ["THE ROCK", "THE PAPER", "THE MIGHTY SCISSORS", 
  "THE LIZARD", "MR. SPOCK"]
VALID_ABBREVIATIONS = ["R", "P", "SC", "L", "SP"]

def win?(first, second)
  first == "THE ROCK" && second == "THE MIGHTY SCISSORS" ||
    first == "THE ROCK" && second == "THE LIZARD" ||
    first == "THE PAPER" && second == "THE ROCK" ||
    first == "THE PAPER" && second == "MR. SPOCK" ||
    first == "THE MIGHTY SCISSORS" && second == "THE PAPER" ||
    first == "THE MIGHTY SCISSORS" && second == "THE LIZARD" ||
    first == "THE LIZARD" && second == "MR. SPOCK" ||
    first == "THE LIZARD" && second == "THE PAPER" ||
    first == "MR. SPOCK" && second == "THE MIGHTY SCISSORS" ||
    first == "MR. SPOCK" && second == "THE ROCK"
end

def display_results(player, computer)
  puts "YOU WHO HAVE CHOSEN #{player} ARE QUAKING IN YOUR BOOTIES \
FOR I HAVE CHOSEN #{computer}"
  if win?(player, computer)
    puts "WAIT. U R WINNER BUT U R NOT SPECIAL"
    score_update(:player)
  elsif win?(computer, player)
    puts "THAT MEANS I WIN AGAIN MEATSACK"
    score_update(:computer)
  else
    prompt "A TIE. I AM AMBIVALENT."
  end
end

def score_update(winner)
  $gamescore[winner] += 1
end

def display_score
  puts "YOU HAVE #{$gamescore[:player]} POINTS AND I HAVE #{$gamescore[:computer]} POINTS."
  if $gamescore[:player] > $gamescore[:computer] && $gamescore[:player] < 5
    puts "YOU ARE WINNING AND I AM SHAKING IN MY BOOTIES"
  elsif $gamescore[:computer] > $gamescore[:player] && $gamescore[:computer] < 5
    puts "NO ONE IS SURPRISED I AM WINNING"
  elsif $gamescore[:computer] == $gamescore[:player]
    puts "THE SCORE IS TIED. YOU CAN CUT THE TENSION WITH THE MIGHTY SCISSORS."
  end
end

def prompt(message)
  puts("=> #{message}")
end

choice = ""
gametype = ""

puts "ROCK PAPER SCISSORS LIZARD SPOCK. A PRIMITIVE GAME"

loop do # main loop
  again = ""
  loop do
    prompt "DO YOUR BEST TO INPUT S FOR [S]INGLE GAME OR F FOR [F]IRST TO 5?"
    loop do
      gametype = gets.chomp.upcase
      break if gametype == "S" || gametype == "F"
      prompt "YOUR BEST IS NOT GOOD. AGAIN! [S]INGLE GAME OR [F]IRST TO 5"
    end
    break
  end
  
  $gamescore = {computer: 0, player: 0}   
    
  loop do # game loop
  
    loop do
      prompt "WHICH ONE IS IT THAT YOU CHOOSE, MORTAL? \
#{VALID_CHOICES[0...-1].join(', ')}, OR #{VALID_CHOICES.last}? \
FEEL FREE TO USE THESE ABBREVIATIONS IF TYPING MANY LETTERS \
IS JUST TOOOO MUCH FOR YOU: #{VALID_ABBREVIATIONS.join(" ")}"
  
      choice = gets.chomp.upcase
      if VALID_CHOICES.include?(choice) 
        break
      elsif VALID_ABBREVIATIONS.include?(choice)
        lookup_choice = VALID_ABBREVIATIONS.index(choice)
        choice = VALID_CHOICES[lookup_choice]
        puts "WELL, NOW WE KNOW U R LAZY. GUESS U R OK WITH THAT"
        break
      else
        prompt "U R DUM. VALID THIS TIME! VALID! AGAIN!"
      end
    end
    
    computer_choice = VALID_CHOICES.sample
    display_results(choice, computer_choice)
    
    if gametype == "F"
      display_score
      if $gamescore[:player] == 5
        puts "YOU HAVE WON. HOW HAVE YOU WON? DID YOU CHEAT? CHEATER."
      elsif $gamescore[:computer] == 5
        puts "OF COURSE I WIN. WHY DO YOU EVEN TRY? U R DUM."
      else
        next
      end
    end
    
    prompt "AGAIN MEATSACK? X TO EXIT"
    again = gets.chomp.upcase
    
    if again == "X"
      puts "I'LL MISS YOU"
    end
    
    break
  end
  break if again == "X"
end
