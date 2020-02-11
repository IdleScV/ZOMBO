require_relative '../config/environment'
require_relative './cli_applications.rb'

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
scroll("The rules to this game is simple...")
line
scroll("1. Your gang of 5 must survive the zombie attack")
line
scroll("2. Each round, pick a member and a weapon to face off against the zombie wave")
line
scroll("3. If you kill all 10 zombies, you win.")
line
scroll("3. If a party member loses to a zombie, they become a zombie.")
line
scroll("4. There are 10 zombies.")
line
line
line
choose_character