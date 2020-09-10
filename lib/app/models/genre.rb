class Genre < ActiveRecord::Base
    has_many :books
    has_many :bookshelves, through: :books

end