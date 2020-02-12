require_relative '../../config/environment'
require 'pry'


def alive_zombies
    Zombie.where({alive: true})
end 

def select_zombie
    zombie = alive_zombies[0]
    zombie
end


def show_zombie_with_stats
    zombie = select_zombie
    arr = [ "****************************************************************",
            "A zombie named "+ zombie["name"] + " appears from the dark . . . .", 
            "He says . . .",
            zombie["catchphrase"],
            "****************************************************************",
            ". . . . . . . . . . .Here are your weapons. . . . . . . . . . . " ]
    arr
end

def return_zombie
    select_zombie
end


