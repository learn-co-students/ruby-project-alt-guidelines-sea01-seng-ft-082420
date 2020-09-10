class Book < ActiveRecord::Base
   belongs_to :bookshelf
   belongs_to :genre
end