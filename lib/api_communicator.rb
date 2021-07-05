require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  json = JSON.parse(response_string.body)
  json = json["results"]
  result = json.find do |instance|
    instance["name"].downcase == character
  end
  result["films"]
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  films.map! do |url|
    response_string = RestClient.get(url)
    film = JSON.parse(response_string.body)["title"]
  end
  i = 1
  films.each do |film|
    puts "#{i}. #{film}"
    i += 1
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
