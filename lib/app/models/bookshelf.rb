class Bookshelf < ActiveRecord::Base
    has_many :ratings
    has_many :books
    @@bookshelf =[]

    def self.add_book(btitle, bauthor, bgenre = nil, best_seller = false, read= false, rating)
      @@bookshelf << Book.create(:title => btitle, :author => bauthor, :genre => bgenre, :best_seller => best_seller, :read => read, :rating => rating)
    end 

    def self.my_books
      @@bookshelf
    end

    def self.change_rating(book,newtitle)
      cbook = Book.find{|key| key.title == book}
      cbook.update(title: newtitle)
      cbook
    end

    def self.sell_books
      Book.destroy_all
      puts "Made some cash!"
    end

  end

  #:first_name => "Emilia" author