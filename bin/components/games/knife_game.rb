require_relative '../../../config/environment'
require 'pry'
require 'colorize' 
require 'colorized_string'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def start(stab_number, num_seconds = 5)
    puts "GO! Stab the zombie!"
    x = Time.now.to_i
    y = Time.now.to_i
    counter = 0
    while y < x + num_seconds
        input = gets.chomp
        if Time.now.to_i < x + num_seconds
            scroll("[]+++||=======> STAB! ".colorize(:red), 0.0001)
            counter += 1
        else
            scroll("============================================", 0.00005)
            scroll("Time's up!", 0.0001)
        end
        y = Time.now.to_i
    end
    #! Failsafe
    def failsafe(text)
        scroll("Type 'I'm done stabbing' to continue. . . ", 0.001)
        input = gets.chomp
        if input == "I'm done stabbing"
            puts("                  ")
            scroll("Ok. Let's go, #{text}.")
            puts("                  ")
        elsif input.length > 7
            puts("                  ")
            scroll("ok, #{text}, close enough . . .")
            puts("                  ")
        else 
            failsafe(text)
        end
    end
    
    scroll( "You stabbed that sucker #{counter} times!", 0.0001)
    if counter >= stab_number
        scroll("============================================")
        scroll("           You win this round!")
        scroll("Appreciate having your brain while you can.")
        scroll("============================================")
        failsafe("champ")
        return true
    else
        scroll("============================================")
        scroll("           You lose this round, ")
        scroll("            he ate your brain.")
        scroll("============================================")
        failsafe("bummer")
        return false
    end
end

def countdown
    3.downto(1) do |i|
        puts "#{'%2d' % i}"
        sleep 1
    end
end

def zombie
    Zombie.where({alive: true})[0]
end

def stab_adjuster
    if zombie.health <= 5
        return 30
    elsif zombie.health == 6
        return 30
    elsif zombie.health == 7
        return 35
    elsif zombie.health == 8
        return 35
    elsif zombie.health == 9
        return 40
    else
        return 45
    end
end

def knife_game_mini
    stab_number = stab_adjuster
    num_seconds = 5
    breaker = "============================================"
    intro = <<-INFO 
You've chosen to stab the zombie.  
Stab with your "enter" key #{stab_number} times to kill it.
Be fast!  You only have #{num_seconds} seconds before he overpowers you and eats your brain!

May your mind be quick and your finger be quicker.
    INFO
    
    
    #! Game Starts
    scroll(intro.colorize(:red))
    scroll(breaker, 0.005)
    sleep 1
    countdown
    scroll(breaker, 0.005)
    start(stab_number, num_seconds)  
end

# puts knife_game_mini




