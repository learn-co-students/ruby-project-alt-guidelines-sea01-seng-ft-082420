class Category < ActiveRecord::Base
    has_many :books
    has_many :bookshelves
end