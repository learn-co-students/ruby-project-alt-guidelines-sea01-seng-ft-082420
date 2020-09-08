class Bookshelf < ActiveRecord::Base
    has_many :ratings
    has_many :books, :foreign_key => :rating
end