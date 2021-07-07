require 'rest-client'
require 'json'
require 'pry'


def get_character_hash(character_name, response_hash)
  response_hash["results"].select do |character|
    character["name"].downcase == character_name
  end
  #automatically returns an array of the character hash
end



def get_all_film_info(the_characters_hash)#get array of all film hashes
  film_urls = the_characters_hash[0]["films"]  #first element in character_hash @ films key
  return_array = []
  film_urls.each do |film|
    response_string = RestClient.get(film) #going through each film url getting all info
    response_hash = JSON.parse(response_string)
    return_array << response_hash
  end
  return_array # the array of all film hashes
end



def get_character_movies_from_api(character_name)

  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  the_characters_hash = get_character_hash(character_name, response_hash)
  get_all_film_info(the_characters_hash)
end



def print_movies(films)
  films.each do |film|
    puts film["title"]
  end
  # some iteration magic and puts out the movies in a nice list
end



def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
