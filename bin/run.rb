require_relative '../config/environment'

puts "Hi there"
input = ""
until input == "exit"
  if input == ""
    puts "Add a book? Enter Y or help"
  else
    puts "enter new command Y, help or exit"
  end
  input = gets.strip 
  if input == "Y" || input == "y"
    puts "enter book title"
    title = gets.strip
    Bookshelf.add_book(title)
  elsif input == "help" || input == "Help"
    puts "here your other options"
    puts "exit"
    puts "update title"
    puts "sell books"
    input = gets.strip
  elsif input == "update title"
    puts "enter book title you want to change"
    title = gets.strip
    puts "enter new title for that book"
    ntitle = gets.strip
    Bookshelf.change_rating(title,ntitle)
  elsif input == "exit"
    break
  else
    puts "please enter Y, N or exit"
  end

end

puts "Have a nice day."

# def help
#   puts "I accept the following commands:"
#   puts "- help : displays this help message"
#   puts "- list : displays a list of songs you can play"
#   puts "- play : lets you choose a song to play"
#   puts "- exit : exits this program"
#   end
  
#   def list(songs)
#   songs.each_with_index do |key,index|
#     puts "#{index+1}. #{key}"
#   end
#   end
  
#   def play(songs)
#   puts "Please enter a song name or number:"
#   input=gets.strip
#   isong=false
#   songs.each do |key|
#     if key===input
#       isong=true
#       puts "Playing #{key}"
#     end
#   end
#   if input==="1" and isong===false
#     puts "Playing #{songs[input.to_i-1]}"
#     isong=true
#   end
#   if isong===false
#     puts "Invalid input, please try again"
#     isong=true
#   end
#   end
  
  
#   def exit_jukebox
#     puts "Goodbye"
#   end
  
  
#   def run(songs)
#   input=""
#   until input === "exit"
#     puts "Please enter a command:"
#     input=gets.strip
#     if input === "exit"
#       break
#     else if input === "help"
#       help
#     else if input === "list"
#       list(songs)
#     else if input === "play"
#       play(songs)
#     end
#   end
#   end
#   end
#   end
#   exit_jukebox
#   end
#   ꘀ