require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get("http://www.swapi.co/api/people/")
  response_hash = JSON.parse(response_string)
  response_hash["results"].each do |result|
    if result["name"].downcase == character_name 
     return result["films"]
    end
  end
end


def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  count = 0
  films.each do |film|
    count += 1
    url_hash = url_retrieval(film)
    puts "#{count}. #{url_hash["title"]}"
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

def url_retrieval(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
