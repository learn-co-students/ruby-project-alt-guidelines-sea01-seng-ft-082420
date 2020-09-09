class Interface
  @@bookshelf =[]

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
      - 6 - See books based on a category\n
      - 7 - Check a book's author\n
      - 8 - Check a book's category\n
      - 9 - Exit
      "
  end 

  def user_choice
    input = gets.chomp
    case input 
    when "1"
      puts "Enter the book's title: "
      title = gets.strip.to_s
      puts "Enter the book's author: "
      author = gets.strip.to_s
      add_book(title, author)
      puts "You successfully added a book!"
      back_to_user_options
    when "2"
      my_books
    when "3"
      # Update a book title\
    when "4"
      # Remove a book from my bookshelf
    when "5"
      # destroy all books 
    when "6"
      # See books based on a category
    when "7"
      # Check a book's author
    when "8"
      # Check a book's category
    when "9"
      exit 
    end 
  end 

  def exit 
    puts "Goodbye! Hope to see you again!"
  end

  # def add_book(title, author)
  #   @@bookshelf << Book.create(:title=>title, :author=>author)
  # end 

  # def my_books
  #   @@bookshelf
  # end

  def back_to_user_options
    user_options
    user_choice
  end 
 

end 

