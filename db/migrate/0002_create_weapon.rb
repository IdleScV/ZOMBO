class CreateWeapon < ActiveRecord::Migration[5.1]

    def change
        create_table :weapons  do |t|
            t.string :weapon_name
            t.integer :strength
        end

    end


end