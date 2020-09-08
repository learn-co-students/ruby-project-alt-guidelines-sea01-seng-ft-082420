class CreateRatings < ActiveRecord::Migration[5.2]
  def change
        create_table :ratings do |r|
          r.integer :book_id
          r.integer :rating
       end
   end
end
