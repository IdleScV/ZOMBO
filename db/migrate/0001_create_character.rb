class CreateCharacter < ActiveRecord::Migration[5.0]

    def change
        create_table :characters do |t|
            t.string :name
            t.string :catchphrase
            t.boolean :alive
        end

    end


end