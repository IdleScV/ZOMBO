require_relative '../../../config/environment'
require 'pry'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def knife_game_mini
    
    intro = <<-INFO 
You've chosen to stab the zombie.  
Stab with your "enter" key as many times as you can.  
Be fast!  You only have 5 seconds before he overpowers you and eats your brain!
May your mind be quick and your finger be quicker.
    INFO
    

    def start
        puts "Stab the zombie!"
        x = Time.now.to_i
        y = Time.now.to_i
        counter = 0
        while y < x + 5
            input = gets.chomp
            if Time.now.to_i < x + 5
                print "Stab!"
                counter += 1
            else
                print "Time's up!"
            end
            y = Time.now.to_i
        end
        puts "You stabbed that sucker #{counter} times!"
        if counter >= 30
            puts "You win this round! Appreciate having your brain while you can."
            return true
        else
            puts "You lose this round. He ate your brain."
            return false
        end
    end

    def countdown
    3.downto(1) do |i|
        puts "#{'%2d' % i}"
        sleep 1
    end
    end

    def count_key_presses(prompt)
        user_input = $stdin.getch
    end
    
    #! Game Starts
    scroll(intro)
    sleep 1
    countdown
    start

end

# puts knife_game_mini




# count_key_presses(prompt)
# puts "you lose!"

# puts "Go!"
# Timeout::timeout(5) do
# ans = gets.chomp
# end
# puts (ans || "User did not respond")



