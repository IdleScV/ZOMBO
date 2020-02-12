require_relative '../../../config/environment'
require "pry"
require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def gun_game_mini
    #! Get current zombie name
    
    def zombie
        Zombie.where({alive: true})[0]
    end
    #! Instructions
    scroll("Type #{zombie.name}'s favorite foods correctly 7 times to shoot him dead!")
    scroll("You have 10 chances!")
    scroll("========================================================================")
    scroll(" ")
    scroll(" ")
    #! Game stars
    scroll("5.....  4.....  3.....  2.....  1.....", 0.2)
    points = 0
    count = 0
    while count < 10 do
        #! Generate a random food item
        food = Faker::Food.dish
        scroll("#{zombie.name} loves to eat ...#{food}!", 0.01)
        scroll("TYPE IT FAST!")
        #! User inputs food item
        input = gets.chomp
        scroll("LOCK AND LOADED . . .                    ", 0.01)
        #! Checks if input == food
        if input.downcase == food.downcase
            scroll("                                     BANG! BANG! BANG!", 0.003)
            points += 1
            
            #! Win
            if points == 7
                scroll("- - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                scroll("                        You WIN!                       ")
                scroll("#{zombie.name} drops backwards into a pile of ..  ")
                scroll("                                     #{food}           ")
                scroll("- - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                       
                return true
            end
        else
            scroll("                                  PEW! PEW! YOU MISSED!!!", 0.003) 
        end
        count += 1
        scroll("           shots  hit #{points.to_s}", 0.003)  
        scroll("           shots left #{10 - count}", 0.003)  
        scroll("- - - - - - - - - - - - - - - - - - - - - - - - - - - -")
        
    end
    #! Lost
                scroll("- - - - - - - - - - - - - - - - - - - - - - - - - - - -")
                scroll("             You Champion has been eaten                       ")
                scroll("            #{zombie.name}:                    ")
                scroll("who knew humans tasted better than #{food}? Yum!           ")
                scroll("- - - - - - - - - - - - - - - - - - - - - - - - - - - -")
    return false
    
end

# puts gun_game_mini

