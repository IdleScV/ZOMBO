class CreateZombie < ActiveRecord::Migration[5.1]

    def change
        create_table :zombies  do |t|
            t.string :name
            t.string :catchphrase
            t.integer :health
            t.boolean :alive
            
        end

    end


end