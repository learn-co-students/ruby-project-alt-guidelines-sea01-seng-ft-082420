class CreateWineDeals < ActiveRecord::Migration[4.2]
    def change
        create_table :wine_deals do |t|
          t.string :name
          t.integer :winery_id
          t.integer :customer_id
        end
    end
end
