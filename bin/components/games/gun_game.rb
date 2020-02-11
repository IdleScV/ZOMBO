require_relative '../../../config/environment'
require "pry"
require 'faker'
def scroll(text, mili_s=0.009)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end


def line
    puts  " "
end

def gun_game_mini
    def zombie
        Zombie.where({alive: true})[0]
    end
    scroll("Type #{zombie.name}'s 7 favorite foods to shoot him dead!")
    line
    scroll("You have 10 chances!")
    line
    scroll("5.....4.....3.....2.....1.....")
    line
    points = 0

    count = 0
    while count < 10 do
        food = Faker::Food.dish
        puts food
        input = gets.chomp
        if input == food
            scroll("BANG! BANG!", 0.003)
            points += 1
            line
            scroll("You have #{points.to_s} points!")  
            if points == 7
                line
                scroll("You WIN!")
                line
                return true
            end
        else
            scroll("WRONG WORD!") 
        end
        line
        count += 1
    end

    

    if points < 7
        scroll("YOU LOSE!")
        return false
    end

end

gun_game_mini