class CreateCustomers < ActiveRecord::Migration[4.2]
    def change
        create_table :customers do |t|
          t.string :name
          t.string :wine_preference
        end
    end
end
