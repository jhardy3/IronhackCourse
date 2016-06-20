class Board
  attr_accessor :positions
  def initialize(positions = [])
    @positions = positions
  end

  def delete_piece(position)
  end
  def move_piece(position)
  end
end

class Piece
  attr_reader :affiliation
  def initialize(board_size, position, affiliation, board)
    @position = position
    @affiliation = affiliation
    @board_size = board_size
    @board = board
  end

  def to_dic
    {@position => self}
  end

  def move

  end

  def validate_move(positions, position)

  end

end

class Bishop < Piece
  def move

  end

  def validate_move(positions, position)
    # Figure out if Rook is near edge of board
    # top = true
    # bottom = true
    # left = true
    # right = true
    # if @position % @board_size == 0
    #   right = false
    # elsif @position % @board_size == 1
    #   left = false
    # end
    # if @position <= @board_size
    #   top = false
    # elsif @position >= @board_size * @board_size - (@board_size - 1)
    #   bottom = false
    # end

    # if top
    # end
    # if left
    if check_left_up(positions, @position, position)
      puts "successfull move"
    else
      puts "unsuccesfull move"
    end

  end

  def check_left_up(positions, position, end_position)
    new_position = position - (@board_size + 1)

      key_positions = positions.keys
      puts key_positions.length

      if key_positions.length == 0
        puts "Fired"
        return false
      else
      key_positions.each do |number|
        if number == new_position
          if positions[number].affiliation == @affiliation
            false
          else
            # create func that deletes piece off board
            @board.delete_piece(position)
            true
          end
        else
          if new_position == end_position
            @board.move_piece(end_position)
            true
          elsif position % @board_size == 1 || position <= @board_size
              false
          else
            check_left_up(positions, new_position, end_position)
          end
        end
      end
    end
  end


  def check_right_down(positions, position, end_position)
    new_position = position + (@board_size + 1)

      key_positions = positions.keys
      key_positions.each do |number|
        if number == new_position
          if positions[number].affiliation == @affiliation
            false
          else
            # create func that deletes piece off board
            @board.delete_piece(position)
            true
          end
        else
          if new_position == end_position
            @board.move_piece(end_position)
            true
          elsif position % @board_size == 0 || position >= @board_size * @board_size - (@board_size - 1)
              false
          else
            check_right_up(positions, new_position, end_position)
          end
        end
    end
  end

  def check_right_up(positions, position, end_position)
    new_position = position - (@board_size - 1)

      key_positions = positions.keys
      key_positions.each do |number|
        if number == new_position
          if positions[number].affiliation == @affiliation
            false
          else
            # create func that deletes piece off board
            @board.delete_piece(position)
            true
          end
        else
          if new_position == end_position
            @board.move_piece(end_position)
            true
          elsif position % @board_size == 0 || position <= @board_size
              false
          else
            check_right_up(positions, new_position, end_position)
          end
        end
      end
  end

  def check_left_down(positions, position, end_position)
    new_position = position + (@board_size - 1)

      key_positions = positions.keys
      key_positions.each do |number|
        if number == new_position
          if positions[number].affiliation == @affiliation
            false
          else
            # create func that deletes piece off board
            @board.delete_piece(position)
            true
          end
        else
          if new_position == end_position
            @board.move_piece(end_position)
            true
          elsif position % @board_size == 1 || position >= @board_size * @board_size - (@board_size - 1)
              false
          else
            check_left_down(positions, new_position, end_position)
          end
        end
      end
  end
end

class King < Piece
  def move

  end

  def validate_move(positions, position)

  end

  def check_up(positions, position, end_position)

  end
  def check_down(positions, position, end_position)
  end

  def check_left(positions, position, end_position)
  end

  def check_right(positions, position, end_position)
  end

end

class Queen < Piece
  def move

  end

  def validate_move(positions, position)

  end
end

class Rook < Piece
  def move

  end

  def validate_move(positions, position)

  end
end

class Pawn < Piece
  def move

  end

  def validate_move(positions, position)

  end
end

class Knight < Piece
  def move

  end

  def validate_move(positions, position)

  end
end
board = Board.new()
bishop = Bishop.new(8, 10, 0, board)
bishop.validate_move({}, 12)
