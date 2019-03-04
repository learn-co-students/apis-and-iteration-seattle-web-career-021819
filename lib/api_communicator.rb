require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  char_hash = response_hash["results"].find {|character| character["name"].downcase == character_name}

  films = char_hash["films"].map {|url| get_json(url)}
  binding.pry

end
 
# def get_movie_info_from_api(movie_name)
#   #make the web request
#   response_string = RestClient.get('http://www.swapi.co/api/films/')
#   response_hash = JSON.parse(response_string)
#
#   movie_hash = response_hash["results"].map {|results| results["title"].downcase == movie_name}
#
#
#
# end

def print_movies(films)
  films.each_with_index do |film, i|
            title = film["title"]
            puts "#{i+1}. #{title}"
        end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def self.get_json(url)
      response = RestClient.get(url)
      json = JSON.parse(response.body)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
