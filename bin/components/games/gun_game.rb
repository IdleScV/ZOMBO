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

    def countdown
        3.downto(1) do |i|
            puts "#{'%2d' % i}".colorize(:yellow)
            sleep 1
        end
    end

    def times_up(win_points, earned_points, food)
               
        scroll("- - - - - - - - - - - - - - - - - - - - - - ")
        puts "Time's up!".colorize(:blue)
        puts "You scored a total of #{earned_points} points!".colorize(:blue)
        
        if earned_points >= win_points
            scroll("- - - - - - - - - - - - - - - - - - - - - - ")
            scroll("                  You WIN!                  ".colorize(:blue))
            scroll("#{zombie.name} drops backwards into a pile of ..  ".colorize(:blue))
            scroll("                                    #{food}     ".colorize(:blue))
            scroll("- - - - - - - - - - - - - - - - - - - - - - ")
        else
             #! Lost
             scroll("- - - - - - - - - - - - - - - - - - - - - - ")
             scroll("        Your Champion has been eaten        ".colorize(:blue))
             scroll("#{zombie.name} says...                    ".colorize(:blue))
             scroll(  "Who knew humans tasted better than #{food}? Yum!           ".colorize(:blue))
             scroll("- - - - - - - - - - - - - - - - - - - - - - ")
        end

    end
    
    

    win_points = zombie.health + 1
    number_seconds = 30
    #! Instructions
    scroll("You have chosen a showdown with #{zombie.name}.".colorize(:blue), 0.05)
    scroll("Type #{zombie.name}'s favorite foods correctly #{win_points} times to shoot him dead!".colorize(:blue), 0.05)
    scroll("You have #{number_seconds} seconds!".colorize(:blue), 0.05)
    scroll("============================================", 0.01)
    scroll(" ")
    #! Game starts
    countdown
    points = 0
    # count = 0
    x = Time.now.to_i
    y = Time.now.to_i
    end_time = x + number_seconds
    while y <= end_time
            #! Generate a random food item
            scroll("============================================", 0.002)
            food = Faker::Food.dish
            scroll("#{zombie.name} loves to eat ...".colorize(:red) + " #{food}".colorize(:light_white) + "!".colorize(:red), 0.01)
            scroll("TYPE IT FAST!".colorize(:green), 0.005)
            #! User inputs food item
            input = gets.chomp
            scroll("LOCK AND LOADED . . .                    ".colorize(:red), 0.005)
            #! Checks if input == food
            if input.downcase == food.downcase
                if Time.now.to_i < end_time
                    time_left = end_time - Time.now.to_i
                    scroll("                                     BANG! BANG! BANG!".colorize(:red), 0.003)
                    scroll("                                     #{time_left} seconds remaining".colorize(:red), 0.003)
                    points += 1
                    y = Time.now.to_i
                else
                    times_up(win_points, points, food)
                        if points >= win_points
                            return true
                        else 
                            return false
                        end
                end
            else
                if Time.now.to_i < end_time
                    time_left = end_time - Time.now.to_i
                    scroll("                                     PEW! PEW! YOU MISSED!!!".colorize(:red), 0.003) 
                    scroll("                                     #{time_left} seconds remaining".colorize(:red), 0.003)
                    y = Time.now.to_i
                else
                    times_up(win_points, points, food)
                        if points >= win_points
                            return true
                        else
                            return false
                        end
                end
            end 
    end  
end
    


# puts gun_game_mini

