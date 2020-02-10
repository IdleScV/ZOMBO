class Fight < ActiveRecord::Base
    belongs_to :character
    belongs_to :zombie
    belongs_to :weapon



    

end