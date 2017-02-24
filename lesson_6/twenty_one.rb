NEW_DECK = { "2" => 4, "3" => 4, "4" => 4, "5" => 4, "6" => 4,
             "7" => 4, "8" => 4, "9" => 4, "10" => 4, "J" => 4, "Q" => 4,
             "K" => 4, "A" => 4 }

FACE_CARDS = ["J", "Q", "K", "A"]

PLAY_TO = 21
HIT_UNTIL = 17

def prompt(string)
  puts "==>#{string}"
end

def clear_screen
  system('clear') || system('cls')
end

def deal_that_card!(deck)
  card = nil
  deck = NEW_DECK.dup if deck.values.all? == 0

  loop do
    card = rand(2..14)
    card = card <= 10 ? card.to_s : FACE_CARDS[card - 11]
    break unless deck[card] == 0
    break
  end
  deck[card] -= 1
  card
end

def display_hand(player, hand)
  puts "#{player} has #{hand.join(', ')}"
end

def score(hand)
  points = 0

  hand.each do |card|
    if card.to_i != 0 # check if integer
      points += card.to_i
    elsif card == "J" || card == "Q" || card == "K"
      points += 10
    end
  end
  points = ace_case!(hand, points) if hand.include?("A")

  points
end

def ace_case!(hand, points)
  hand.each do |card|
    if card == "A"
      points += points <= PLAY_TO - 11 ? 11 : 1
    end
  end
  points
end

def player_choice
  loop do
    prompt "[H]it or [S]tay?"
    h_or_s = gets.chomp.upcase
    break(h_or_s) if h_or_s == "H" || h_or_s == "S"
    prompt "I'm so sorry, I don't understand. Let me try again, please."
  end
end

def busted?(current_score)
  current_score > PLAY_TO
end

def calculate_winner(current_score)
  if current_score[:player] > PLAY_TO then :player_bust
  elsif current_score[:dealer] > PLAY_TO then :dealer_bust
  elsif current_score[:player] == current_score[:dealer] then :tie
  elsif current_score[:player] > current_score[:dealer] then :player
  else :dealer
  end
end

def display_winner(result)
  case result
  when :player_bust
    puts "So sorry, but since you busted you lost. Next time maybe!"
  when :dealer_bust
    puts "Couldn't help but bust. I lose. Oh well!"
  when :tie
    puts "How about that, we tied!"
  when :player
    puts "Well look at you! The winner!"
  else
    puts "Looks like I win. Gosh!"
  end
end

def update_game_score!(winner, score)
  if winner == :player_bust || winner == :dealer
    score[:dealer] += 1
  elsif winner == :dealer_bust || winner == :player
    score[:player] += 1
  end
end

def display_game_score(score)
  puts <<~HEREDOC
  We're playing to 5! Right now you have won #{score[:player]} and
  I have won #{score[:dealer]}. Can't wait to see what happens now!
  ------------------------

  HEREDOC
end

def ultimate_victory?(game_score)
  game_score.values.include?(5)
end

def display_ultimate_victory(last_won)
  round_winner = if last_won == :dealer_bust || last_won == :player
                   "Player"
                 else
                   "Dealer"
                 end

  winner = if last_won == :dealer_bust || last_won == :player
             "So cool! You are"
           else
             "Wow, I am"
           end

  puts "#{round_winner} wins the round..."
  puts "and that means that's the game! #{winner} the winner!"
end

def again?
  prompt "That was fun! Would you like to play again? Y/N"
  response = gets.chomp.upcase
  if response == "Y"
    puts "That great! Great! Ok here we go!"
    sleep(1)
    clear_screen
  end
  response == "Y"
end

### MAIN LOOP ###

puts "Welcome to #{PLAY_TO}! Enjoy your game!".center(80)

loop do
  game_score = { player: 0, dealer: 0 }

  loop do
    deck = NEW_DECK.dup
    player_hand = []
    dealer_hand = []
    current_score = { player: 0, dealer: 0 }

    2.times do
      player_hand.push deal_that_card!(deck)
      dealer_hand.push deal_that_card!(deck)
    end

    display_hand("Player", player_hand)
    puts "Dealer shows #{dealer_hand[0]}"

    current_score = { player: score(player_hand), dealer: score(dealer_hand) }

    until current_score[:player] >= PLAY_TO
      h_or_s = player_choice
      current_score[:player] = score(player_hand)
      if h_or_s == "S"
        prompt "You're staying there at #{current_score[:player]}! Good for you!"
        break
      end

      prompt "Hit! Exciting!"

      player_hand.push deal_that_card!(deck)
      display_hand("Player", player_hand)

      current_score[:player] = score(player_hand)
    end

    if busted?(current_score[:player])
      prompt "You poor thing, that's over #{PLAY_TO}. Don't be sad but you busted."
    end

    if current_score[:player] == PLAY_TO
      puts "Ooooh #{PLAY_TO}! I'll have to get really lucky now just to tie!"
    end

    display_hand("Dealer", dealer_hand)

    unless busted?(current_score[:player]) || current_score[:dealer] >= HIT_UNTIL

      loop do
        sleep(1)
        puts "Dealer hits!"
        sleep(0.3)
        dealer_hand.push deal_that_card!(deck)
        display_hand("Dealer", dealer_hand)
        sleep(1)
        current_score[:dealer] = score(dealer_hand)

        if busted?(current_score[:dealer])
          puts "Oh dear! Bust!"
          sleep(1)
          break
        elsif current_score[:dealer] >= HIT_UNTIL
          puts "Dealer stays at #{current_score[:dealer]}"
          sleep(1)
          break
        end
      end

    end

    winner = calculate_winner(current_score)
    update_game_score!(winner, game_score)

    unless ultimate_victory?(game_score)
      display_winner(winner)
      display_game_score(game_score)
      sleep(4)

      clear_screen
      display_game_score(game_score)
    end

    next unless ultimate_victory?(game_score)

    display_ultimate_victory(winner)
    break
  end

  break unless again?
end

puts "Oh, ok. Um... goodbye. Come back sometime?"
