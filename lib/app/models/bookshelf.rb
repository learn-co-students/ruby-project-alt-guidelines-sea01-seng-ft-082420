class Bookshelf < ActiveRecord::Base
    has_many :categories, through: :books
    has_many :books


    @@bookshelf =[]

    def self.add_book(title, author)
      @@bookshelf << Book.create(:title=>title, :author=>author)
    end 

    def self.my_books
      @@bookshelf
    end

    # def self.update_book(book,newtitle)
    #   cbook = Book.find{|key| key.title == book}
    #   cbook.update(title: newtitle)
    #   cbook
    # end

    # def self.sell_books
    #   Book.destroy_all
    #   puts "Made some cash!"
    # end

    # def self.delete_by(title)
    #   Book.where(title: title).destroy_all
    # end 

  end

  #:first_name => "Emilia" author
  #def self.add_book(btitle, bauthor, bgenre = nil, best_seller = false, read= false, rating
  # :author => bauthor, :genre => bgenre, :best_seller => best_seller, :read => read, :rating => rating