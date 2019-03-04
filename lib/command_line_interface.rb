def welcome
  # puts out a welcome message here!
  puts "Welcome to the Star Wars Info page"
end

def get_character_from_user
  puts "please enter a character name or quit (q) to exit"
  # use gets to capture the user's input. This method should return that input, downcased.
  response = gets.chomp.downcase
end
