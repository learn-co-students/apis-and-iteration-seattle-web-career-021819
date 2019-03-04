#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
is_running = true
while is_running
  choice = get_character_from_user
  if choice == "q" || choice == "quit"
    is_running = false
  else
    show_character_movies(choice)
  end
end

puts "Goodbye"
