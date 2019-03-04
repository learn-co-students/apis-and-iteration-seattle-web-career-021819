def welcome
  # puts out a welcome message here!
  puts "Hi! What's your favorite Starwars character?!?!?!"
end

def get_character_from_user
  puts "please enter a character name"
  # use gets to capture the user's input. This method should return that input, downcased.
  char_name = STDIN.gets.chomp.downcase
end
