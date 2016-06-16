class User
  def initialize(authenticator, text_utility)
    @text_utility = text_utility
    @authenticator = authenticator
  end

  def use_txt_utility
    if @authenticator.check_auth
      @text_utility.manipulate_text
      puts "Would you like to use the utility again? (Y/N)"
      decision = gets.chomp.upcase
      if decision == "Y"
        use_txt_utility
      else
        puts "Thanks for using TextUtility 2000!"
      end
    else
      puts "Unauthenticated User - Access Denied"
    end
  end
end

class Authenticator
  def initialize(password, username)
    @password = password
    @username = username
    @authenticated = false
  end

  def check_auth
    if @authenticated == false
      puts "Enter Username:"
      username = gets.chomp

      puts "Enter Password:"
      password = gets.chomp

      if username == @username && password == @password
        @authenticated = true
        true
      else
        puts "Incorrect Credentials, Try Again? (Y/N)"
        decision = gets.chomp
        if decision.upcase == "Y"
          check_auth
        else
          false
        end
      end
    else
      true
    end
  end

end

class TextUtility

  def manipulate_text
    puts "Would you like to:\n
    [A] Count Words Of String\n
    [B] Count Letters Of String\n
    [C] Reverse Text\n
    [D] Convert To Uppercase\n
    [E] Conver To Lowercase"

    choice = gets.chomp.upcase

    if choice == "A"
      count_words
    elsif choice == "B"
      count_text
    elsif choice == "C"
      reverse_text
    elsif choice == "D"
      convert_to_uppercase
    elsif choice == "E"
      convert_to_lowercase
    else
      puts "Invalid Choice"
    end
  end

  def convert_to_uppercase
    puts "Enter a string to make it uppercase"
    print "-> "
    input = gets.chomp.upcase
    puts input
  end

  def convert_to_lowercase
    puts "Enter a string to make it lowercase"
    print "-> "
    input = gets.chomp.lowercase
    puts input
  end

  def reverse_text
    puts "Enter a string to reverse it"
    print "-> "
    input = gets.chomp.reverse
    puts input

  end

  def count_words
    puts "Enter a string to check how many words it contains"
    print "-> "
    input = gets.chomp.split(" ")
    puts input.length
  end

  def count_text
    puts "Enter a string to check how many characters it contains"
    print "-> "
    input = gets.chomp.delete(" ")
    puts input.length
  end
end

authenticator = Authenticator.new("123", "Jake")
text_util = TextUtility.new
user = User.new(authenticator, text_util)

user.use_txt_utility
