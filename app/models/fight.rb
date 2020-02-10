class Fight < ActiveRecord::Base
    belongs_to :character
    belongs_to :zombie
    belongs_to :weapon



    def initialize(char_inst, zombie_inst, weapon_inst)
        @character = char_inst
        @zombie = zombie_inst
        @weapon = weapon_inst

    end
    

end