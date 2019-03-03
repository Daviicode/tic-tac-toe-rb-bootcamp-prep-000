def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
  index = user_input.to_i - 1
  return index
end


def valid_move?(board, index)
  def position_taken?(array, index)
    if array[index] == " " || array[index] == "" || array[index] == nil
      return false
    else
      return true
    end
end


def on_board?(num)
    if num.between?(0, 8) == true
      return true
    else
      return false
    end
end


  if (position_taken?(board, index)) == false && (on_board?(index) == true)
    return true
  else
    return false
  end
end

def move(board, location, current_player = "X")
  board[location.to_i-1] = current_player
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end


WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|index| board[index] == "X"}
      winner = combo
    elsif combo.all? {|index| board[index] == "O"}
      winner = combo
    else
      false
    end
  end
  if winner != nil
    winner
  else
    false
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  if full?(board)
    if won?(board) == false
      true
    else 
      false
    end
  else
    false
  end
end
  
def winner(board)
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|index| board[index] == "X"}
      winner = "X"
    elsif combo.all? {|index| board[index] == "O"}
      winner = "O"
    else
    end
  end
  winner
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end
  


def turn_count (board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
  counter += 1  
    end
  end
  counter
end
    
    
    
def current_player(board)  
  if turn_count(board) % 2 == 0 
    return "X"
  else 
    return "O"
  end
end

def play(board)
  counter = 0 
  until counter == 9 
  turn(board)
  counter += 1
  end
end

