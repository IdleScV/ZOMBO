
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


rules = ["The rules to this game is simple...", 
    "1. Your gang of 5 must survive the zombie attack",
    "2. Each round, pick a member and a weapon to face off against the zombie wave",
    "3. If you kill all 10 zombies, you win.",
    "4. If a party member loses to a zombie, they become a zombie.",
    "5. There are 10 zombies." ]

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


zombie_obj = 
weapon_obj = 