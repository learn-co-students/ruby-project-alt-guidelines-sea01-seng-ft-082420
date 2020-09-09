require 'pry'
class Interface
  attr_reader :bookshelf, :book, :genre, :shelf

  def welcome 
    puts "Hi there, welcome to the BOOKSHELF!"
    puts "What is your name?"
    name = gets.chomp.to_s.capitalize
    @shelf = Bookshelf.all.find{|shelf| shelf.name == name}
    if @shelf == nil
      @shelf = Bookshelf.create(:name => name)
    # else
    #   user_options
    #   user_choice
    end
  end 

  def user_options
    puts "Please select from the following options (using numbers 1-9) what you would like to do:\n
      - 1 - Add a book to my bookshelf\n
      - 2 - See all books on my bookshelf\n
      - 3 - Update a book title\n
      - 4 - Remove a book from my bookshelf\n
      - 5 - Clear bookshelf\n
      - 6 - See what genres I have on my bookshelf\n
      - 7 - Check a book's author\n
      - 8 - Search books by genre\n
      - 9 - Exit
      "
  end 

  def user_choice
    # puts "what is your name?"
    # name = gets.chomp.to_s
    # shelf = Bookshelf.all.find{|shelf| shelf.name == name}
    # if shelf == nil
    #   shelf = Bookshelf.create(:name => name)
    #   puts "New shelf created"
    #   user_options
    # else
    #   user_options
    # end
    input = gets.chomp
    case input 
    when "1"
      puts "Enter the book's title: "
      ntitle = gets.strip.to_s
      puts "Enter the book's author: "
      nauthor = gets.strip.to_s
      puts "Enter a book's genre:"
      ngenre = gets.strip.to_s
      nbook = Book.create(:title => ntitle, :author => nauthor)
      igen = Genre.all.find{|genre| genre.name == ngenre}
      if igen == nil
        ngen = Genre.create(:name => ngenre)
      else
        ngen = Genre.all.find{|genre| genre.name == ngenre}
      end
      nbook.genre_id = ngen.id
      nbook.bookshelf_id = @shelf.id
      nbook.save
      puts "You successfully added a book!"
      sleep 2
      back_to_user_options
    when "2"
      puts "These are your books: "
      puts "Title - Author"
      mbooks = Book.all.select{|book| book.bookshelf_id == @shelf.id}
      mbooks.map{|book| puts "#{book.title} - #{book.author}"}
      sleep 3
      back_to_user_options
    when "3"
      # Update a book title
      puts "Enter the title of the book you want to change:"
      old_title = gets.strip.to_s
      puts "Enter the new title: "
      new_title = gets.strip.to_s
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
      book_title = gets.strip.to_s
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
      answer = gets.strip.to_s
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
      gs = []  
      Book.all.select do |b|
          if b.bookshelf_id == @shelf.id
            Genre.all.each do |g|
              if g.id == b.genre_id
                gs << "#{g.name}"
              end
            end
          end
        end
      gs = gs.uniq
      # binding.pry
      gs.each do |g|
        puts g
      end
      sleep 3
      back_to_user_options
    when "7"
      # Check a book's author
      puts "Enter the title of the book you want to see the author of: "
      abook = gets.strip.to_s
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
       user_genre = gets.strip.to_s 
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


  # def Bookshelf.add_book(title, author)
  #   Book.create(:title=>title, :author=>author)
  # end 

  # def Bookshelf.my_books
  #   Book.all
  # end

  def back_to_user_options
    user_options
    user_choice
  end 
 

end 

# binding.pry
# 0


# Book.all.select do |b|
#   if b.bookshelf_id == @shelf.id
#     Genre.all.map do |g|
#       if g.id == b.genre_id
#         g.name
#       end
#     end
#   end
# end.uniq
#