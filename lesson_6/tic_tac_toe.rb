INITIAL_MARKER = " "
FIRST = "computer"
PLAYER_MARKER = "X"
COMPUTER_MARKER = "Y"
PLAYER_NAME = "CHEATER"
COMPUTER_NAME = "NO SURPRISE I"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "==>" + msg
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "clear"
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts""
end
# rubocop:enable Metrics/AbcSize

def intialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ", ", end_word = "or")
  if arr.length == 1
    arr[0]
  elsif arr.length == 2
    "#{arr[0]} #{end_word} #{arr[1]}"
  else
    arr.join(separator).insert(-2, end_word + " ")
  end
end

def place_piece!(brd, current_player)
  player_placement!(brd) if current_player == "player"
  computer_placement!(brd) if current_player == "computer"
end

def player_placement!(brd)
  square = ""
  loop do
    prompt "CHOOSE YOUR TERRITORY IN THIS HERE GAME OF WAR \
    (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "THAT MAKES NO SENSE. AGAIN!"
    end
  end
  brd[square] = PLAYER_MARKER
end

def computer_decision(brd, marker, antimarker)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      next if brd.values_at(*line).include?(antimarker)
      line.each do |position|
        if brd[position] == INITIAL_MARKER
          square = position
          break
        end
      end
      break
    end
  end
  square
end

def computer_placement!(brd)
  square = computer_decision(brd, COMPUTER_MARKER, PLAYER_MARKER)
  square = computer_decision(brd, PLAYER_MARKER, COMPUTER_MARKER) if square == nil
  if square == nil
    square = if empty_squares(brd).include?(5)
      5
    else
      empty_squares(brd).sample
    end
  end
  brd[square] = COMPUTER_MARKER
end

def alternate_player(current_player)
  if current_player == "computer"
    "player"
  else
    "computer"
  end
end

def who_first
  loop do
    prompt "WHO GOES FIRST THIS TIME MEATSACK? [M]EATSACK OR YOUR \
[S]UPERIOR?"
    choice = gets.chomp
    starter = case choice.upcase
    when "M" then "player"
    when "S" then "computer"
    else
      prompt "ERRORERROEROEERRORERORRR THIS IS NOT HARD."
      next
    end
    break(starter)
  end
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd, *total_score)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return PLAYER_NAME
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return COMPUTER_NAME
    end
  end
  nil
end

def update_score(winner, score)
  if winner == COMPUTER_NAME
    score[:computer] += 1
  else
    score[:player] += 1
  end
end

def ultimate_victory(total_score)
  prompt "I WIN EVERYTHING I AM THE BEST YOU SUUUUUUCK" if total_score[:computer] == 5
  if total_score[:player] == 5
    prompt "YOU CHEATED FIVE TIMES JUST SO YOU COULD BEAT ME? SHAME. \
    SHAAAAME!!!!"
  end
end

def again?
  prompt "I COULD DO THIS FOREVER. YOU? (Y/N)"
  answer = gets.chomp
  if answer.upcase == 'N'
    puts "SO BE IT. ONCE AGAIN INTO THE VOID."
    return false
  end
  true
end

loop do
  score = {player: 0, computer: 0}
  loop do
    board = intialize_board
    current_player = FIRST
    display_board(board)
    if FIRST == "choose"
      current_player = who_first
    end
    loop do
      place_piece!(board, current_player)
      display_board(board)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} IS THE ONE WHO WON THE GAME!"
      update_score(winner, score)
    else
      prompt "IS A TIE! YOUR CHEATING DID NOT BRING YOU VICTORY THIS TIME."
    end
    
    prompt "THE TOTAL SCORE IS #{score[:player]} to #{score[:computer]}"
    prompt "RETURN TO CONTINUE"
    gets
    next unless score.values.include?(5)
    
    ultimate_victory(score)
    break
  end
  break unless again?
end
