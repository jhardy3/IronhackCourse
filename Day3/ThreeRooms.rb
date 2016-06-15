#define a room class
require "colorize"

class Room
  attr_accessor :north_room, :south_room, :east_room, :west_room

  def initialize(room_name, room_definition)
    @room_name = room_name
    @room_definition = room_definition
    @north_room = north_room = 0
    @south_room = south_room = 0
    @east_room = east_room = 0
    @west_room = west_room = 0
  end

  def connect_room(room, direction)
      if direction == "N" && room.south_room == 0
        room.south_room = self
        @north_room = room
      elsif direction == "S" && room.north_room == 0
        room.north_room = self
        @south_room = room
      elsif direction == "W" && room.east_room == 0
        room.east_room = self
        @west_room = room
      elsif direction == "E" && room.west_room == 0
        room.west_room = self
        @east_room = room
      else
        puts "Invalid input or room is already connected!"
      end
  end

  def room_description
    "You are in #{@room_name}. #{@room_definition}."
  end

  def room_connection_description
    return_str = "**************************************************************************************\n#{room_description.colorize(:blue)}\nYou can go: "
    if @north_room != 0
      return_str += " [N] Up "
    end
    if @south_room != 0
      return_str += " [S] Down "
    end
    if @west_room != 0
      return_str += " [W] Left "
    end
    if @east_room != 0
      return_str += " [E] Right "
    end
    return_str
  end

  def room_hang_up
  end

  def can_go_direction(direction)
    room_hang_up
    if direction == "N"
      if @north_room == 0
        false
      else
        true
      end
    elsif direction == "S"
      if @south_room == 0
        false
      else
        true
      end
    elsif direction == "W"
      if @west_room == 0
        false
      else
        true
      end
    elsif direction == "E"
      if @east_room == 0
        false
      else
        true
      end
    else
      false
    end
  end

  def return_connecting_room(direction)
    if direction == "N"
      north_room
    elsif direction == "S"
      south_room
    elsif direction == "E"
      east_room
    elsif direction == "W"
      west_room
    else
      puts "Invalid Direction!!!"
    end
  end
end

class DangerousRoom < Room
  def initialize(room_name, room_definition, room_danger, room_correct_answer, end_game)
    @room_correct_answer = room_correct_answer
    @end_game = end_game
    @room_danger = room_danger

    @room_name = room_name
    @room_definition = room_definition
    @north_room = north_room = 0
    @south_room = south_room = 0
    @east_room = east_room = 0
    @west_room = west_room = 0
  end

  def room_hang_up
    puts @room_danger
    input = gets.chomp.upcase
    if input != @room_correct_answer
      puts @end_game
      abort
    end
  end

  def can_go_direction(direction)
    room_hang_up
    true
  end

  def return_connecting_room(direction)
    if @north_room != 0
      north_room
    elsif @south_room != 0
      south_room
    elsif @east_room != 0
      east_room
    elsif @west_room != 0
      west_room
    else
      puts "Can't go here"
    end
  end

end

class PuzzleRoom < Room
  def initialize(room_name, room_definition, room_puzzle, puzzle_answer)
    @room_puzzle = room_puzzle
    @puzzle_answer = puzzle_answer

    @room_name = room_name
    @room_definition = room_definition
    @north_room = north_room = 0
    @south_room = south_room = 0
    @east_room = east_room = 0
    @west_room = west_room = 0
  end

  def room_hang_up
    puts @room_puzzle
    puzzle_retry
  end

  def puzzle_retry
    input = gets.chomp.upcase
    if input != @puzzle_answer
      puts "That's not it..."
      puzzle_retry
    end
  end

  def can_go_direction(direction)
    room_hang_up
    true
  end

  def return_connecting_room(direction)
    if @north_room != 0
      north_room
    elsif @south_room != 0
      south_room
    elsif @east_room != 0
      east_room
    elsif @west_room != 0
      west_room
    else
      puts "Can't go here"
    end
  end
end

class GameMaster
  def initialize(game_message, current_room, game_answer)
    @game_answer = game_answer
    @game_message = game_message
    @player_name = "Hawk"
    @current_room = current_room
    @inventory = []
  end

  def add_str_to_inv(clue)
    length = @inventory.length
    clue_with_position = "#{length + 1}. #{clue}"
    @inventory.push(clue_with_position)
  end

  def display_inventory
    @inventory.each do |clue|
      puts clue
    end
  end

  def set_player_name
    puts @game_message
    puts "Enter name of player: "
    player_name = gets.chomp
    if player_name == ""
      puts "Ok, Hawk"
    else
      puts "Ok, #{player_name}.. Get to it."
      @player_name = player_name
    end
  end

  def load_room(room)
    puts room.room_connection_description
    print(">")
    move_to_room(gets.chomp.upcase)
  end

  def move_to_room(direction)

    if direction == "ESC"
      abort
    end
    if direction == @game_answer
      puts "YOU WIN!!!!\n
      All that coffee finally destroyed Craig's heart while he was training.\n
      What a damned fool!"
      abort
    end
    if direction == "CLUE"
      puts "Enter a new clue"
      add_str_to_inv(gets.chomp)
      puts "Here are your clues now:"
      display_inventory
      puts "press enter to continue"
      gets.chomp
      load_room(@current_room)
    elsif direction == "CLUES"
      display_inventory
      puts "press enter to continue"
      gets.chomp
      load_room(@current_room)
    elsif @current_room.can_go_direction(direction)
      @current_room = @current_room.return_connecting_room(direction)
      load_room(@current_room)
    else
      puts "Impossible route - Try again"
      puts "I hope that wasnt a guess..."
      load_room(@current_room)
    end
  end

  def start_game
    set_player_name
    load_room(@current_room)
  end
end

room_one_message = "
  As you inspect his wallet, you discover his name is Craig.\n
  The 50 Euros is still in his wallet... Just as you were told. Strange.\n
  Cant be a mugging\n
  ...\n
  Better get moving.\n
"

room_two_message = "
  Not much here. Just an empty street with a bunch of coffee cups everywhere.\n
  There is a little shop to the south...\n
  That could be worth checking out.
"
dngr_rm_2_msg = "
  As you leave the shop, you can't help but notice the smell.\n
  Something is definitely off...\n
  Your head starts to feel a little light.\n
  Your heartbeat is in your ears/\n
  What's going on here?\n
  [Poison] [Gas] [Sorcery]
"
dngr_rm_2_ans = "GAS"
dngr_rm_2_fail = "You pass out from gas..."

rm_7_msg = "
  Somebody approaches you...\n
  They tell you that all these damn cups lining the street were from Craig.\n
  You didn't catch their name...\n
  Come on! Can't slip up again.
"

rm_10_msg = "
  A person approaches you. Her name is Lauren.\n
  She seems to be rather bitter for some reason.\n
  When you start to ask her about Craig she gets really antsy.\n
  She shows no sympathy when she is told of his death...\n
  Hmmmm
"

rm_9_msg = "
  To the west the avenuse connect back to the scene of Craig's death\n
  Is this some sort of dimension warp?\n
  There is a poster on a building.. '5k winner will receive 5k Euros'
"

rm_5_msg = "
  Something fairly interesting to the East... \n
  A pamphlet blows across the street, 'quicker-step coffee will make you quicker!'
"

dngr_1_msg = "
  A 1/4 mile track lies before you\n
  A man approaches with an interesting expression..\n
  He is crazy no doubt!\n
  He puts a gun up to you, what is the last name of\n
  THE FASTEST MAN ALIVE?!?!?!?!?!!?!?!?\n
  [Zeph] [Bolt] [Trill] [Marci] [Hardy]
"

rm_6_msg = "
  A man named Kahlil is standing by a parked car\n
  You ask him about Craig and he tells you\n
  He was addicted to running, even though he didn't look it\n
  He wanted nothing more than to win the upcoming 5k.\n
  He would do and try absolutely anything to win that 5k
"

rm_3_msg = "
  A woman named Maria approaches you\n
  She tells you of a fight between a man and Craig...\n
  She tells you it was over a cup of coffee.\n
  Supposedly the coffee would make you run faster.\n
  She says Craig was the kinda guy to run himself to death
"

rm_4_msg = "
  literally nothing here...\n
  Reminds me of a poem..\n
  The good deeds a man has done before defend him...
"

rm_8_msg = "
  A fellow named Flo approaches\n
  'Yeah, I fought with Craig. He was nuts about that coffee'\n
  I don't even think it works.\n
  I took it easy on him though... He has a heart condition.
"
dngr_1_ans = "BOLT"
dngr_1_fail = "Come on! Shame on you. He shoots you for being so oblivious\n and runs off as fast a Bolt of lighting."

room_one = Room.new("The Scene", room_one_message)
room_two = Room.new("The Avenues", room_two_message)
room_three = Room.new("The Avenues", rm_3_msg)
room_four = Room.new("The Avenues", rm_4_msg)
room_five = Room.new("The Avenues", rm_5_msg)
room_six = Room.new("The Avenues", rm_6_msg)
room_seven = Room.new("The Avenues", rm_7_msg)
room_eight = Room.new("The Avenues", rm_8_msg)
room_nine = Room.new("Craig did it", rm_9_msg)
room_ten = Room.new("The Avenues", rm_10_msg)


dangerous_room = DangerousRoom.new("The Track", "Back in my day...", dngr_1_msg, dngr_1_ans, dngr_1_fail)
puzzle_room = PuzzleRoom.new("Craig's room", "A really stupid riddle is written on the wall", "Some like me hot, some like me cold, some like me mild, some like me bold ", "COFFEE")

dangerous_room_two = DangerousRoom.new("Eduardo's Kicks", "Really nice shoes line the walls...", dngr_rm_2_msg, dngr_rm_2_ans, dngr_rm_2_fail)


room_one.connect_room(room_two, "W")
room_one.connect_room(room_three, "E")
room_one.connect_room(room_four, "N")
room_one.connect_room(room_five, "S")
room_three.connect_room(room_six, "E")
room_two.connect_room(room_seven, "W")
room_four.connect_room(room_eight, "N")
room_five.connect_room(room_nine, "S")
room_five.connect_room(dangerous_room, "E")
room_eight.connect_room(puzzle_room, "W")
room_six.connect_room(room_nine, "E")
room_nine.connect_room(room_ten, "S")
room_ten.connect_room(room_seven, "E")



room_two.connect_room(dangerous_room_two, "S")


welcome_message = "
  WELCOME TO THE AVENUES OF BARCELONA\n

  A mystery has unfolded in Barcelona, a murderous mystery\n
  Navigate the streets using N S E W buttons on your keyboard when that direction is available.\n
  The poor fellow who was murdered was found in the middle of the street around 6:00 AM.\n
  He was wearing shorts, extremely expensive shoes, and lacked a shirt.\n
  There are indications of struggle. His knuckles are swollen red.\n
  He had a wallet with 50 Euros and nothing seems to be missing. He also died clutching a coffee cup.\n
  Start exploring the avenues, and if at anypoint you discover the who did it, simply enter his/her first name.\n
  BE WARNED... The price of an incorrect answer is quite high...\n
  To remember your clues, type 'clue' and save it\n
  If you want to view your clues type 'clues'\n
  Well go on, start looking...\n
  ...\n
  ...\n
  Oh right, and what's your name?
"

game = GameMaster.new(welcome_message, room_one, "CRAIG")
game.start_game


#define a game class
