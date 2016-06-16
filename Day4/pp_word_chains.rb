require 'ruby-dictionary'

class WordChain
    def initialize(dictionary)
        @dictionary = dictionary
    end

    def find_chain(initial_word, last_word)
      if check_word(initial_word) && check_word(last_word)
        word1_array = initial_word.chars.to_a
        word2_array = last_word.chars.to_a
        alter_word(word1_array, word2_array)
      end
    end

    def alter_word(word_arr, last_word_arr)
      words_array = [word_arr.join("")]
      place_holder = ""
      counter = 0
      word_length = last_word_arr.length
        while word_arr.join != last_word_arr.join
          if word_arr[counter] != last_word_arr[counter]
            new_word_arr = word_arr
            place_holder = new_word_arr[counter]
            new_word_arr[counter] = last_word_arr[counter]
            new_word = new_word_arr.join
            if check_word(new_word)
              words_array.push(new_word)
              word_arr = new_word.chars.to_a
              counter = 0
            else
              word_arr[counter] = place_holder
              counter += 1
            end
          else
            counter += 1
          end
      end

    puts words_array
    end

    def check_word(word)
      @dictionary.exists?(word)
    end

end

dictionary = Dictionary.from_file("/usr/share/dict/words")
my_chain = WordChain.new(dictionary)
my_chain.find_chain("cat", "dog")
my_chain.find_chain("lead", "gold")
my_chain.find_chain("ruby", "code")
