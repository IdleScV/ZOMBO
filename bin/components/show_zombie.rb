require_relative '../../config/environment'
require 'pry'

# def scroll(text, mili_s=0.04)
#     text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
# end

# def line
#     puts  " "
# end

# def list_zombies
#     Zombie.all
# end

def alive_zombies
    Zombie.where({alive: true})
end 

def select_zombie
    zombie = alive_zombies[0]
    zombie
end


def show_zombie_with_stats
    zombie = select_zombie
    arr = [ "************************************************************",
            "A zombie named "+ zombie["name"] + " appears from the dark . . . .", 
            "He says . . ." + zombie["catchphrase"], 
            "He has " + zombie["health"].to_s + " health points...",
            "************************************************************",
            "Choose your weapon . . ." ]
    arr
end

def return_zombie
    select_zombie
end


