require 'imdb'

class MovieController
  def search_movies(search_term)
    movie_array = Imdb::Search.new(search_term)
    movie_array.movies[0..9]
    #ToDo Make Sure Poster Exists
  end
end

class QuestionController
  def initialize(movies)
    @movies = movies
  end

  def generate_question
    question = "Which movie was produced in #{@movies[0].release_date}?"
  end

  def self.check_question(user_answer, answer)
    user_answer == answer
  end
end


#cast_characters,
#cast_member_ids,
#cast_members,
#cast_members_characters,
#company,
#countries,
#director,
#filming_locations,
#genres,
#initialize,
#languages,
#length,
#mpaa_rating,
#plot,
#plot_summary,
#plot_synopsis,
#poster,
#rating,
#release_date,
#tagline,
#trailer_url,
#votes,
#writers,
#year

#also_known_as, #id, #title, #url
