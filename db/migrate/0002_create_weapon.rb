class CreateWeapon < ActiveRecord::Migration[5.0]

    def change
        create_table :weapons  do |t|
            t.string :weapon_name
            t.integer :strength
        end

    end


end