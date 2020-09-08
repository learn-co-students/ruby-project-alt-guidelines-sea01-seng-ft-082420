class CreateBookshelves < ActiveRecord::Migration[5.2]
  def change
    create_table :bookshelves do |b|
      b.integer :book_id
      b.integer :rating_id
    end
  end
end
