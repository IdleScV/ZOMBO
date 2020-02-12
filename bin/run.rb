require_relative '../config/environment'
require_relative '../db/seeds.rb'
require_relative './components/ascii_art.rb'
require_relative './components/choose_character.rb'
require_relative './components/show_zombie.rb'
require_relative './components/mini_games.rb'
require_relative './components/game_result.rb'



def scroll(text, mili_s=0.03)#! deploy at 0.03
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
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

@bar= "============================================"

rules = ["The rules to this game are simple...", 
    "1. At least one member of your gang must survive the zombie attacks",
    "2. Each round, pick a member and a weapon to face off against the zombie wave",
    "3. If you kill all 10 zombies, you win.",
    "4. There are 10 zombies.  Good luck." ]

#! Introduction
scroll("Hello player, please type in your name . . . ")
#! Player name
@player_name = gets.chomp
#! Title screen
scroll(". . . . . . . initiating . . . . . . .")
scroll(@bar, 0.01)
scroll(title, 0.005)
scroll(@bar, 0.01)
#! Rules
scroll("#{@player_name}, let's play!")
rules.each{|string| scroll(string) }
scroll(@bar, 0.01)


def game_play
    @bar= "============================================"
    #! Win Condition
    if Character.where({alive: true}).length == 0
        scroll(Losing, 0.001)
        scroll(@bar, 0.01)
        scroll("Good job #{@player_name}.")
        return
    elsif Zombie.where({alive: true}).length == 0
        scroll(Winning, 0.001)
        scroll(@bar, 0.01)
        scroll("Better luck, try again next time #{@player_name}")
        return
    end
    #! Choose Character
    character_obj = choose_character
    #! Show Zombie
    show_zombie_with_stats.each {|stat| scroll(stat) }
    zombie_obj = select_zombie
    #! Choose weapon and goes into minigame
    results = minigame(create_fight(character_obj, zombie_obj))
    scroll(@bar, 0.01)
    #! uses results to either kill human or zombie
    input_result(results, character_obj, zombie_obj)
    scroll(@bar, 0.01)
    #! Recurssive Gameplay
    game_play
end

game_play