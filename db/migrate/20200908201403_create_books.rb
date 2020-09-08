class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |b|
      b.string :title
      b.string :author
      b.string :genre
      b.boolean :best_seller
      b.boolean :read
      b.integer :rating
    end
  end
end
