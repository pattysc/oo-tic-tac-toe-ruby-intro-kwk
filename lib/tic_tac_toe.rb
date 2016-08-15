class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    @display_board = puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token="X")
    @move = @board[index-1] = token
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

 def valid_move?(index)
    index = index.to_i - 1
    if index.between?(0, 8)
      if !position_taken?(index)
        return true
      end
    end
    false
  end

  def turn_count
    counter = 0
    @board.each do |value|
      if value == "O" || value == "X"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn_count.odd? ? "O" : "X"
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip.to_i

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Invalid number, try again!"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |winblock|
      position_1 = @board[winblock[0]]
      position_2 = @board[winblock[1]]
      position_3 = @board[winblock[2]]

      if (position_1 == "X") && (position_2 == "X") && (position_3 == "X")
        return winblock
      elsif (position_1 == "O") && (position_2 == "O") && (position_3 == "O")
        return winblock
      end
    end
    return false
  end
  #
  def full?
    @board.none? {|i| i == " "}
  end
  #
  def draw?
    if !won?
      full? ? true : false
    end
  end
  #
  def over?
    full? || won? ||  draw?
  end

  def winner
    WIN_COMBINATIONS.each do |winblock|
      position_1 = @board[winblock[0]]
      position_2 = @board[winblock[1]]
      position_3 = @board[winblock[2]]

      if (position_1 == "X") && (position_2 == "X") && (position_3 == "X")
        return "X"
      elsif (position_1 == "O") && (position_2 == "O") && (position_3 == "O")
        return "O"
      end
    end
    return nil
  end

  def play
    until won? || over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
