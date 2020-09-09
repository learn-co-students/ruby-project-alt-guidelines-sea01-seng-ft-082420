class Interface

  def welcome 
    puts "Hi there, welcome to the BOOKSHELF!"
  end 

  def user_options
    puts "Please select from the following options (using numbers 1-9) what you would like to do:\n
      - 1 - Add a book to my bookshelf
      - 2 - See all books on my bookshelf\n
      - 3 - Update a book title\n
      - 4 - Remove a book from my bookshelf\n
      - 5 - Clear bookshelf\n
      - 6 - See books based on a category\n
      - 7 - Check a book's author\n
      - 8 - Check a book's category\n
      - 9 - Exit
      "
  end 

  def user_choice
    input = gets.strip
    case input 
    when 1 
      puts "Enter the book's title: "
      title = gets.strip
      puts "Enter the book's author: "
      author = gets.strip 
      Bookshelf.add_book(title, author)
      puts "You successfully added a book!"
      user_options
    when 2
      Bookshelf.my_books
      user_options
    when 3
      # Update a book title\
      user_options
    when 4
      # Remove a book from my bookshelf
      user_options
    when 5
      # destroy all books 
      user_options
    when 6
      # See books based on a category
      user_options
    when 7
      # Check a book's author
      user_options
    when 8
      # Check a book's category
      user_options
    when 9
      # exit 
    end 
  end 

end 


# puts "Hi there"
# input = ""
# until input == "exit"
#   if input == ""
#     puts "Add a book? Enter Y or help"
#   else
#     puts "enter new command Y, help or exit"
#   end
#   input = gets.strip 
#   if input == "Y" || input == "y"
#     puts "enter book title"
#     title = gets.strip
#     Bookshelf.add_book(title)
#   elsif input == "help" || input == "Help"
#     puts "here your other options"
#     puts "exit"
#     puts "update title"
#     puts "sell books"
#     input = gets.strip
#   elsif input == "update title"
#     puts "enter book title you want to change"
#     title = gets.strip
#     puts "enter new title for that book"
#     ntitle = gets.strip
#     Bookshelf.change_rating(title,ntitle)
#   elsif input == "exit"
#     break
#   else
#     puts "please enter Y, N or exit"
#   end

# end

# puts "Have a nice day."

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