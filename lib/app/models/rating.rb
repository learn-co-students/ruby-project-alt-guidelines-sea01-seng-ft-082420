class Rating < ActiveRecord::Base
    belongs_to :book
    belongs_to :bookshelf, :foreign_key => :book
end