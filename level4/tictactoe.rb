require 'pry'

INITIAL_MARKER = " ".freeze
PLAYER_MARKER = "X".freeze
COMP_MARKER = "O".freeze
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]].freeze

def prompt(msg)
  puts "==> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system "cls"
  puts "You're an #{PLAYER_MARKER}.    Computer is an #{COMP_MARKER}."
  puts ""
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
  puts ""
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator = ", ", conjunction = "or")
  string = ""
  if arr.length > 2
    arr[0...-1].each { |num| string << (num.to_s + separator)}
    string << conjunction + " " + arr[-1].to_s
  elsif arr.length == 2
    string = arr[0].to_s + " " + conjunction + " " + arr[1].to_s
  else
    string = arr[0].to_s
  end
  prompt "Choose a square (#{string}):"
end

def players_turn!(brd)
  square = ''
  loop do
    joinor(empty_squares(brd))
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, not a valid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def defensive(brd)
  def_array = brd.keys.select { |num| brd[num] == PLAYER_MARKER }
  def_choices = []
  def_final = []
  WINNING_LINES.each do |lines|
    check = lines - def_array
    def_choices << check if check.size == 1
  end
  def_final << (def_choices.flatten! & empty_squares(brd)) 
  def_final.flatten 
end

def offensive(brd)
  off_array = brd.keys.select { |num| brd[num] == COMP_MARKER }
  off_choices = []
  off_final = []
  WINNING_LINES.each do |lines|
    check = lines - off_array
    off_choices << check if check.size == 1
  end
  off_final << (off_choices.flatten! & empty_squares(brd))
  off_final.flatten
end

def comp_turn!(brd)
  if offensive(brd).any? 
    square = offensive(brd).sample
  elsif defensive(brd).any? 
    square = defensive(brd).sample
  elsif empty_squares(brd).include?(5)
    square = 5
  else
    square = empty_squares(brd).sample
  end
  brd[square] = COMP_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "Player"
    elsif brd.values_at(*line).count(COMP_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def place_piece!(brd, current)
  if current == "Player"
    players_turn!(brd)
  else
    comp_turn!(brd)
  end
end

def alternate_player(current)
  if current == "Player"
    "Computer"
  else
    "Player"
  end
end


player_score = 0
comp_score = 0
current_player = "Player"

loop do
  board = initialize_board
  
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end

  display_board(board)

  if someone_won?(board)
    detect_winner(board) == "Player"? player_score += 1 : comp_score += 1 
    prompt "Player: " + player_score.to_s
    prompt "Computer: " + comp_score.to_s
    if (player_score == 5 || comp_score == 5)
      prompt "#{detect_winner(board)} won!"
      comp_score = 0
      player_score = 0
    end
  else
    puts "It's a tie!"
    prompt "Player: " + player_score.to_s
    prompt "Computer: " + comp_score.to_s
  end

  prompt "Play again? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt "Thanks for playing Tic Tact Toe!  Goodbye!"
