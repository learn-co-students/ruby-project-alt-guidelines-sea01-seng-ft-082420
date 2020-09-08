class Book < ActiveRecord::Base
    has_many :ratings
    has_many :bookshelves, :foreign_key => :ratings
end