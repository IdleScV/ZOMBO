require_relative '../../../config/environment'
require 'pry'

def intro
puts <<-INFO 
You've chosen to stab the zombie.  
Stab with your "s" key as many times as you can.  
Be fast!  You only have 5 seconds before he overpowers you and eats your brain!
May your mind be quick and your finger be quicker.
INFO
end

def start 
    puts "Go!"
    x = Time.now.to_i
    y = Time.now.to_i
    counter = 0
    while y < x+5
        input = gets.chomp
        print "Stab!"
        counter += 1
        y = Time.now.to_i
    end
    puts "time's up!"
    puts "You stabbed that sucker #{counter} times!"
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
    


intro
sleep 1
countdown
start
# count_key_presses(prompt)
# puts "you lose!"

# puts "Go!"
# Timeout::timeout(5) do
# ans = gets.chomp
# end
# puts (ans || "User did not respond")







>>>>>>> lauren_v2
