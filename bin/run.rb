require_relative '../config/environment'


space =  " "
"HELLO CHILD, PLEASE TYPE IN YOUR NAME...".each_char {|c| putc c ; sleep 0.05; $stdout.flush }
puts space
player_name = gets.chomp
"RECEIVED!".each_char {|c| putc c ; sleep 0.15; $stdout.flush }
puts space



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

bar.each_char {|c| putc c ; sleep 0.02; $stdout.flush }
puts space
title.each_char {|c| putc c ; sleep 0.005; $stdout.flush }
puts space
bar.each_char {|c| putc c ; sleep 0.02; $stdout.flush }
puts space
"OK, #{player_name}. LETS PLAY!".each_char {|c| putc c ; sleep 0.10; $stdout.flush }
puts space
"The rules to this game is simple...".each_char {|c| putc c ; sleep 0.10; $stdout.flush }
puts space
"1. Your gang of 5 must survive the zombie attack"
puts space
"2. Each round,"