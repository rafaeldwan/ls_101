INITIAL_MARKER = " "
FIRST = "choose"
PLAYER_MARKER = "X"
COMPUTER_MARKER = "Y"
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

def prompt(msg)
  puts "==>" + msg
end

def thinking
  3.times do
    5.times do
      sleep(0.1)
      print "."
    end
    sleep(0.4)
    prompt ""
  end
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

def joinor(arr, seperator = ", ", endword = "or")
  if arr.length == 1
    arr[0]
  elsif arr.length == 2
    "#{arr[0]} #{endword} #{arr[1]}"
  else
    arr.join(seperator).insert(-2, endword + " ")
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

def intelligence(brd, marker, antimarker)
  square = 0
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
  puts "MY TURN SUCKA"
  square = intelligence(brd, COMPUTER_MARKER, PLAYER_MARKER)
  square = intelligence(brd, PLAYER_MARKER, COMPUTER_MARKER) if square == 0
  if square == 0
    if empty_squares(brd).include?(5)
      square = 5
    else
      square = empty_squares(brd).sample
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

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd, *total_score)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      unless total_score.empty?
        # binding.pry
        total_score[0][0] += 1
      end
      return "CHEATER"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      unless total_score.empty?
        total_score[0][1] += 1
      end
      return "NO SURPRISE I"
    end
  end
  false
end

def ultimate_victory(total_score)
  prompt "I WIN EVERYTHING I AM THE BEST YOU SUUUUUUCK" if total_score[1] == 5
  if total_score[0] == 5
    prompt "YOU CHEATED FIVE TIMES JUST SO YOU COULD BEAT ME? SHAME. \
    SHAAAAME!!!!"
  end
end

loop do
  score = [0, 0]
  loop do
    board = intialize_board
    current_player = FIRST
    display_board(board)
    if FIRST == "choose"
      current_player = loop do
        prompt "WHO GOES FIRST THIS TIME MEATSACK? [M]EATSACK OR YOUR \
[S]UPERIOR?"
        choice = gets.chomp
        case choice.upcase
        when "M" then break("player")
        when "S" then break("computer")
        else
          prompt "ERRORERROEROEERRORERORRR THIS IS NOT HARD."
        end
      end
    end
    loop do
      place_piece!(board, current_player)
      display_board(board)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    if someone_won?(board)
      prompt "#{detect_winner(board, score)} IS THE ONE WHO WON THE GAME!"
    else
      prompt "IS A TIE! YOUR CHEATING DID NOT BRING YOU VICTORY THIS TIME."
    end
    prompt "THE TOTAL SCORE IS #{score[0]} to #{score[1]}"
    prompt "RETURN TO CONTINUE"
    gets
    next unless score.include?(5)
    ultimate_victory(score)
    break
  end
  prompt "I COULD DO THIS FOREVER. YOU? (Y/N)"
  answer = gets.chomp
  if answer.upcase.start_with?('N')
    puts "SO BE IT. ONCE AGAIN INTO THE VOID."
    break
  end
end
