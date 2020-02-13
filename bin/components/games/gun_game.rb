require_relative '../../../config/environment'
require "pry"
require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def gun_game_mini
    #! Get current zombie name

    def countdown
        3.downto(1) do |i|
            puts "#{'%2d' % i}"
            sleep 1
        end
    end

    def times_up(win_points, earned_points, food)
               
        scroll("- - - - - - - - - - - - - - - - - - - - - - ")
        puts "Time's up!"
        puts "You scored a total of #{earned_points} points!"
        
        if earned_points >= win_points
            scroll("- - - - - - - - - - - - - - - - - - - - - - ")
            scroll("                  You WIN!                  ")
            scroll("#{zombie.name} drops backwards into a pile of ..  ")
            scroll("                                    #{food}     ")
            scroll("- - - - - - - - - - - - - - - - - - - - - - ")
        else
             #! Lost
             scroll("- - - - - - - - - - - - - - - - - - - - - - ")
             scroll("        Your Champion has been eaten        ")
             scroll("#{zombie.name} says...                    ")
             scroll(  "Who knew humans tasted better than #{food}? Yum!           ")
             scroll("- - - - - - - - - - - - - - - - - - - - - - ")
        end

    end
    
    def zombie
        Zombie.where({alive: true})[0]
    end
    win_points = 7
    number_seconds = 30
    #! Instructions
    scroll("Type #{zombie.name}'s favorite foods correctly #{win_points} times to shoot him dead!")
    scroll("You have #{number_seconds} seconds!")
    scroll("============================================")
    scroll(" ")
    #! Game starts
    countdown
    points = 0
    count = 0
    x = Time.now.to_i
    y = Time.now.to_i
    end_time = x + number_seconds
    while y < end_time
            #! Generate a random food item
            food = Faker::Food.dish
            scroll("#{zombie.name} loves to eat ...#{food}!", 0.01)
            scroll("TYPE IT FAST!", 0.005)
            #! User inputs food item
            input = gets.chomp
            scroll("LOCK AND LOADED . . .                    ", 0.005)
            #! Checks if input == food
            if input.downcase == food.downcase
                if Time.now.to_i < end_time
                    scroll("                                     BANG! BANG! BANG!", 0.003)
                    scroll("                                     #{end_time - Time.new.to_i} seconds remaining", 0.003)
                    points += 1
                    y = Time.now.to_i
                else
                    times_up(win_points, points, food)
                    return true
                end
            else
                if Time.now.to_i < end_time
                    scroll("                                     PEW! PEW! YOU MISSED!!!", 0.003) 
                    scroll("                                     #{end_time - Time.new.to_i} seconds remaining", 0.003)
                    y = Time.now.to_i
                else
                    times_up(win_points, points, food)
                    return false
                end
            end 
    end  
end
    


puts gun_game_mini

