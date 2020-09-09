require 'pry'
class Interface
  attr_reader :bookshelf, :book, :genre

  def welcome 
    puts "Hi there, welcome to the BOOKSHELF!"
  end 

  def user_options
    puts "Please select from the following options (using numbers 1-9) what you would like to do:\n
      - 1 - Add a book to my bookshelf\n
      - 2 - See all books on my bookshelf\n
      - 3 - Update a book title\n
      - 4 - Remove a book from my bookshelf\n
      - 5 - Clear bookshelf\n
      - 6 - Search books by genre\n
      - 7 - Check a book's author\n
      - 8 - Check a book's genre\n
      - 9 - Exit
      "
  end 

  def user_choice
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
      ngen = Genre.create(:name => ngenre)
      nbook.genre_id = ngen.id
      nbook
      puts "You successfully added a book!"
      sleep 2
      back_to_user_options
    when "2"
      puts "These are your books: "
      puts "Title - Author"
      Book.all.map {|book| puts "#{book.title} - #{book.author}"}
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
        Book.destroy_all
        puts "Bookshelf emptied."
        sleep 3
        back_to_user_options
      else 
        sleep 3
        back_to_user_options
      end
    when "6"
      # Search books by genre
    when "7"
      # Check a book's author
    when "8"
      # Check a book's genre
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

# puts "Enter the book's title: "
# ntitle = gets.strip.to_s
# puts "Enter the book's author: "
# nauthor = gets.strip.to_s
# puts "Enter a book's genre:"
# ngenre = gets.chomp
# nbook = Book.create(:title => ntitle, :author => nauthor)
# ngen = Genre.create(:name => ngenre)
# nbook.genre_id = ngen.id
# puts "You successfully added a book!"
# sleep 2
# back_to_user_options