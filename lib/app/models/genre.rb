class Genre < ActiveRecord::Base
    has_many :books
    has_many :bookshelves, through: :books

    def self.new_genre(genre_name)
        ngenre = Genre.create(:name => genre_name)
    end
end