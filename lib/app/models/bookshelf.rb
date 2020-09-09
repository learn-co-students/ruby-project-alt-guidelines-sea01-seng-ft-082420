class Bookshelf < ActiveRecord::Base
    has_many :books
    has_many :genres, through: :books 
    

  
    # def drake_made_this
    #   if Artist.all.find{|a| a.name == "Drake"}== nil
    #     drake = Artist.create(name: "Drake")
    #   end
    #   self.artist = Artist.all.find{|a| a.name == "Drake"}




   
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