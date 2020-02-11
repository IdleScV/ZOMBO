
require_relative '../config/environment'
require_relative '../db/seeds.rb'
require_relative './components/choose_character.rb'
require_relative './components/show_zombie.rb'
require_relative './components/mini_games.rb'



def scroll(text, mili_s=0.04)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end


def line
    puts  " "
end

title = <<-'EOF'

_______  _______  _______  ______   _______ 
/ ___   )(  ___  )(       )(  ___ \ (  ___  )
\/   )  || (   ) || () () || (   ) )| (   ) |
    /   )| |   | || || || || (__/ / | |   | |
   /   / | |   | || |(_)| ||  __ (  | |   | |
  /   /  | |   | || |   | || (  \ \ | |   | |
 /   (_/\| (___) || )   ( || )___) )| (___) |
(_______/(_______)|/     \||/ \___/ (_______) 

                            THE GAME

EOF

bar = "*********************************************"


rules = ["The rules to this game are simple...", 
    "1. At least one member of your gang must survive the zombie attacks",
    "2. Each round, pick a member and a weapon to face off against the zombie wave",
    "3. If you kill all 10 zombies, you win.",
    "4. There are 10 zombies.  Good luck." ]

# * Intro
scroll("Hello player, please type in your name . . . ")
line
player_name = gets.chomp
scroll(". . . . . initiate . . . . .", 0.15)
line
scroll(bar, 0.02)
line
scroll(title, 0.007)
line
scroll(bar, 0.02)
line
scroll("#{player_name}, let's play!")
line
rules.each{|string| scroll(string); line }
line
line
character_obj = choose_character
line
line
show_zombie_with_stats.each {|stat| scroll(stat, 0.02); line}
line
line
results = minigame(pick_weapon)
line
line
input_result(results)


# zombie_obj = 
# weapon_obj = 