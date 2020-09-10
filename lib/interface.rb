require 'pry'
class Interface
  attr_reader :bookshelf, :book, :genre, :shelf

  def welcome 
    puts "Hi there, welcome to the BOOKSHELF!"
    sleep 1
    #  puts "              / \\   "
    #  puts "            /     \\  "
    #  puts "          /         \\    "
    #  puts "        /             \\    "
    #  puts "       /                \\    "
    #  puts "　　　／／　　            ＼＼   "
    #  puts "　　 ／    （●） 　 （●）    ＼    "
    #  puts"　  ／::::::⌒（__人__）⌒::::: ＼     "
    puts "What is your name?"
    name = gets.chomp.to_s.capitalize
    @shelf = Bookshelf.all.find{|shelf| shelf.name == name}
      if @shelf == nil
         @shelf = Bookshelf.create(:name => name)
      end
  end 

  def user_options
    puts "                                                                                 \n
    Please select from the following options (using numbers 1-9) what you would like to do:\n
      - 1 - Add a book to my bookshelf\n
      - 2 - See all books on my bookshelf\n
      - 3 - Update a book title\n
      - 4 - Remove a book from my bookshelf\n
      - 5 - Clear bookshelf\n
      - 6 - See what genres I have on my bookshelf\n
      - 7 - Check a book's author\n
      - 8 - Search books by genre\n
      - 9 - Exit"
  end 

  def user_choice
    input = gets.chomp.capitalize
    case input 
      when "1"
        # Add a book to my bookshelf
        puts "Enter the book's title: "
         entered_title = gets.strip.to_s.capitalize
        puts "Enter the book's author: "
         entered_author = gets.strip.to_s.capitalize
        puts "Enter a book's genre: "
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
        puts "You successfully added a book!"
        sleep 2
        back_to_user_options

      when "2"
        # See all books on my bookshelf
        puts "These are your books: "
        puts "TITLE - AUTHOR"
        puts "_____________________"
        all_books = Book.all.select{|book| book.bookshelf_id == @shelf.id}
        all_books.map{|book| puts "#{book.title} - #{book.author}"}
        sleep 3
        back_to_user_options

      when "3"
      # Update a book title
        puts "Enter the title of the book you want to change:"
        old_title = gets.strip.to_s.capitalize
        puts "Enter the new title: "
        new_title = gets.strip.to_s.capitalize
        ubook = Book.all.find{|book| book.title == old_title}
          if ubook == nil
            puts "Your title was not updated. You do not have that book on your bookshelf!"
            sleep 3
            back_to_user_options
          end
        ubook.update(:title => new_title)
        puts "Book updated."
        sleep 3
        back_to_user_options

    when "4"
      # Remove a book from my bookshelf
      puts "Enter the title of the book you want to delete: "
      book_title = gets.strip.to_s.capitalize
      destroy_book = Book.all.find{|book| book.title == book_title}
        if destroy_book == nil
          puts "You do not have that book on your bookshelf!"
          sleep 3
          back_to_user_options
        end
      destroy_book.destroy
      puts "Book has been removed."
      sleep 3
      back_to_user_options

    when "5"
      # destroy all books 
      puts "Are you sure you want to empty your bookshelf???(Y/N)"
      answer = gets.strip.to_s.capitalize
        if answer == "y" || answer== "Y"
          dbooks = Book.all.map do |shelf| 
            if shelf.bookshelf_id == @shelf.id
              shelf.destroy
            end
          end
          puts "Bookshelf emptied."
          sleep 3
          back_to_user_options
        else 
          sleep 3
          back_to_user_options
        end

    when "6"
      # See what genres I have on my bookshelf
      puts "These are genres you have: "
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

    when "7"
      # Check a book's author
      puts "Enter the title of the book you want to see the author of: "
      abook = gets.strip.to_s.capitalize
      tbook = Book.all.find{|book| book.title== abook}
        if tbook == nil
          puts "You don't have that book"
          sleep 3
          back_to_user_options
        else
          puts "#{abook}'s author: #{tbook.author}"
          sleep 3
          back_to_user_options
        end

    when "8"
       # Search books by genre
      puts "Enter the genre that you would like to see the books of: "
      user_genre = gets.strip.to_s.capitalize
      u_genre = Genre.all.find{|genre| genre.name == user_genre}
        if u_genre ==nil 
          puts "Sorry, there is no such genre in your collection"
          sleep 3
          back_to_user_options
        else 
          my_books = Book.all.select {|book| book.genre_id ==u_genre.id}
          puts "Here are your books within the #{user_genre} genre: "
          my_books.each_with_index do |book, i|
            puts "#{i+1}. #{book.title}"
           end 
          sleep 3
          back_to_user_options
          end 

    when "9"
      exit 

    end 
  end 

  def exit 
    puts "Goodbye! Hope to see you again!"
  end

  def back_to_user_options
    user_options
    user_choice
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
