require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

scroll( "You are playing an old game")
scroll("--------------------------------------------")
scroll("There are #{Character.where({alive: true}).count} Champions left, ")
scroll("                            and #{Zombie.where({alive: true}).count} Zombies")
scroll("--------------------------------------------")