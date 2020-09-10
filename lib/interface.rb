require 'pry'

class Interface
  attr_reader :bookshelf, :book, :genre, :shelf, :prompt
  

  def initialize
    @prompt = TTY::Prompt.new 
  end

  def welcome 
    puts "Hi there, welcome to the BOOKSHELF!".green
    sleep 2
    puts "What is your name?".green
    name = gets.chomp.to_s.capitalize
    @shelf = Bookshelf.all.find{|shelf| shelf.name == name}
      if @shelf == nil
         @shelf = Bookshelf.create(:name => name)
      end
  end 

  def user_options
    self.prompt.select("Please select from the following options what you would like to do: (Use ↑/↓ arrow keys, press Enter to select)".green) do |option|
      option.choice "Add a book to my bookshelf", -> {self.add_book}
      option.choice "See all books on my bookshelf", -> {self.see_my_books}
      option.choice "Update a book title", -> {self.update_title}
      option.choice "Remove a book from my bookshelf", -> {self.remove_book}
      option.choice "Clear bookshelf", -> {self.clear_bookshelf}
      option.choice "See what genres I have on my bookshelf", -> {self.my_genres}
      option.choice "Check a book's author", -> {self.find_author}
      option.choice "Search books by genre", -> {self.find_by_genre}
      option.choice "Exit", -> {self.exit}
     end
  end 

  def add_book
    puts "Enter the book's title: ".green
     entered_title = gets.strip.to_s.capitalize
    puts "Enter the book's author: ".green
     entered_author = gets.strip.to_s.capitalize
    puts "Enter a book's genre: ".green
     entered_genre = gets.strip.to_s.capitalize
    new_book = Book.create(:title => entered_title, :author => entered_author)
    igen = Genre.all.find{|genre| genre.name == entered_genre}
      if igen == nil
        ngen = Genre.create(:name => entered_genre)
      else
        ngen = Genre.all.find{|genre| genre.name == entered_genre}
      end
    new_book.genre_id = ngen.id
    new_book.bookshelf_id = @shelf.id
    new_book.save
    puts "You successfully added a book!".green
    sleep 2
    back_to_user_options
  end 

  def see_my_books
    puts "                               "
    puts "These are your books: ".yellow
    puts "TITLE - AUTHOR".yellow
    puts "_____________________".yellow
     all_books = Book.all.select{|book| book.bookshelf_id == @shelf.id}
      all_books.map{|book| puts "#{book.title} - #{book.author}"}
    sleep 3
    back_to_user_options
  end 

  def update_title
    puts "Enter the title of the book you want to change:".green
     old_title = gets.strip.to_s.capitalize
    puts "Enter the new title: ".green
     new_title = gets.strip.to_s.capitalize
    ubook = Book.all.find{|book| book.title == old_title}
      if ubook == nil
        puts "Your title was not updated. You do not have that book on your bookshelf!".red
        sleep 3
        back_to_user_options
      end
    ubook.update(:title => new_title)
    puts "Book updated.".green
    sleep 3
    back_to_user_options
  end 

  def remove_book
    puts "Enter the title of the book you want to delete: ".green
     book_title = gets.strip.to_s.capitalize
    destroy_book = Book.all.find{|book| book.title == book_title}
      if destroy_book == nil
        puts "You do not have that book on your bookshelf!".red
        sleep 3
        back_to_user_options
      end
    destroy_book.destroy
    puts "Book has been removed.".red
    sleep 3
    back_to_user_options
  end 

  def clear_bookshelf
    puts "Are you sure you want to empty your bookshelf???(Y/N)".red
     answer = gets.strip.to_s.capitalize
       if answer == "y" || answer== "Y"
         dbooks = Book.all.map do |shelf| 
           if shelf.bookshelf_id == @shelf.id
             shelf.destroy
            end
          end
          puts "Bookshelf emptied.".green
          sleep 3
          back_to_user_options
        else 
          sleep 3
          back_to_user_options
        end
  end 

  def my_genres
    puts "These are genres you have: ".yellow
    genres = []  
     Book.all.select do |book|
       if book.bookshelf_id == @shelf.id
          Genre.all.each do |genre|
            if genre.id == book.genre_id
              genres << "#{genre.name}"
            end
          end
        end
      end
    genres = genres.uniq
     genres.each do |genre|
       puts genre
      end
    sleep 3
    back_to_user_options
  end 

  def find_author
    puts "Enter the title of the book you want to see the author of: ".green
    abook = gets.strip.to_s.capitalize
    tbook = Book.all.find{|book| book.title== abook}
      if tbook == nil
        puts "You don't have that book".red
        sleep 3
        back_to_user_options
      else
        puts "#{abook}'s author: #{tbook.author}".green
        sleep 3
        back_to_user_options
      end
  end

  def find_by_genre
    puts "Enter the genre that you would like to see the books of: ".green
     user_genre = gets.strip.to_s.capitalize
    u_genre = Genre.all.find{|genre| genre.name == user_genre}
      if u_genre ==nil 
        puts "Sorry, there is no such genre in your collection".red
        sleep 3
        back_to_user_options
      else 
        my_books = Book.all.select {|book| book.genre_id ==u_genre.id}
        puts "Here are your books within the #{user_genre} genre: ".yellow
          my_books.each_with_index do |book, i|
           puts "#{i+1}. #{book.title}"
          end 
        sleep 3
        back_to_user_options
      end 
  end 

  def exit 
    puts "******GOODBYE! HOPE TO SEE YOU AGAIN!******".green
  end

  def back_to_user_options
    puts "Would you like to go back to the main menu? (Y/N)".green
    input = gets.strip.to_s 
      if input == "Y" || input == "y"
        user_options
      else
        exit 
      end 
  end 
   

end 

# binding.pry
# 0

  # def cats
  #   puts "                      /^--^\      /^--^\     /^--^\"
  #   puts "                      |・ω・|     | ・ω・|    | ・ω・|"
  #   puts "                      \____/      \____/     \____/"
  #   puts "                    /      \    /      \   /      \"
  #   puts"                     |      |    |        | |        |"
  #   puts" _ _ _ _ _ _ _ _ _ _ \__  __/_ _ _\__  __/ _ \__  __/_ _ _ _ _ _ _ _ _ _ "
  #   puts"| | | | | | | | | | | | \ \ | | | / / | | | | \ \ | | | | | | | | | | | |"
  #   puts"| | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | |"
  #   puts"########################/ /######\ \###########/ /#######################"
  #   puts"| | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | |"
  #   puts"|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|"
  # end


      #  puts "              / \\   "
    #  puts "            /     \\  "
    #  puts "          /         \\    "
    #  puts "        /             \\    "
    #  puts "       /                \\    "
    #  puts "　　　／／　　            ＼＼   "
    #  puts "　　 ／    （●） 　 （●）    ＼    "
    #  puts"　  ／::::::⌒（__人__）⌒::::: ＼     "