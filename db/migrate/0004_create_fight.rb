class CreateFight < ActiveRecord::Migration[5.0]

    def change
        create_table :fights  do |t|
            t.integer :character_id
            t.integer :zombie_id
            t.integer :weapon_id
            t.boolean :win
            
        end

    end


end