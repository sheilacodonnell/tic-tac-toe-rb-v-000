WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Right column
  [1,4,7],   # Middle column
  [2,5,8],  # Left column
  [0,4,8],  # Right diagonal
  [2,4,6]   # Left diagonal
]

def display_board(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

def input_to_index(user_input)
    (user_input).to_i-1
  end

def move(board, index, value)
    board[index] = value
    current_player(board)
  end

  def position_taken?(board, index)
    if board[index] == " " || board[index] == "" || board[index] == nil
      false
    elsif board[index] == "X" || board[index] == "O"
      true
  end
  end

  def valid_move?(board,index)
    if position_taken?(board, index) == false && index.between?(0, 8)
    true
  end
end

def turn(board)
puts "Please enter 1-9:"
user_input = gets.strip
index = input_to_index(user_input)
if valid_move?(board, index) == true
    move(board, index, current_player(board))
    display_board(board)
  else turn(board)
    puts "Please enter 1-9:"

end
end



def turn_count(board)
  counter = 0
  board.each do |cell|
    if cell == "X" || cell == "O"

      counter += 1
end
end
      return counter
end

def current_player(board)
  if turn_count(board) % 2 == 0

    return "X"
  end
  else
    return "O"
end



def won?(board)
  # if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  #     return false
  # end

WIN_COMBINATIONS.each do |win_combination|
  if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    return win_combination
  elsif
    board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
  end
end
else
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  return board[won?(board)[0]] if won?(board)
  # return "X" || "O"

end




def play(board)
    while !over?(board)
      turn(board)
    end

    if won?(board)
      puts "Congratulations #{winner(board)}!"

    elsif draw?(board) == true
       puts "Cats Game!"
    end
end

# def play(board)
#     until over?(board) == true
#       turn(board)
#     end if won?(board) == true && winner(board) == "X" || "O"
#
# end
#   if draw?(board) == true
#        puts "Cats Game!"
#   else won?(board)
#      puts "Congratulations #{winner(board)}!"
#
# end

# def play(board)
#   until over?(board) == true turn(board)
#   end if won?(board) == true && winner(board) == "X"
#   return "Congratulations X!"
# elsif won?(board) == true && winner(board) == "O"
#   return "Congratulations O!"
#   if draw?(board) == true
#     return "Cats Game!"
#   end
# end
