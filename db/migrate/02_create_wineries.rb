class CreateWineries < ActiveRecord::Migration[4.2]
    def change
        create_table :wineries do |t|
          t.string :name
          t.string :wine_type
        end
    end
end
