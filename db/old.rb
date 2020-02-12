require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

scroll( "You are playing an old game")
scroll(". . . . . . . . . . . . . .")
scroll( "There are #{Character.count} Champions left and #{Zombie.count} Zombies")
scroll(". . . . . . . . . . . . . . ")