require_relative '../../../config/environment'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def sword_game_mini
    chance_max = 10
    intro = <<-INFO
You've chosen to live life on the edge and face the zombie with a sword.
Guess the zombie's favorite number from 1 to 100 before he overpowers you and slashes your neck!
You have #{chance_max} guesses.
    INFO

    def guessing_game(num_chances)
        puts "Choose a number between 1 and 100."
        x = rand(1..100)
        chances = 0
        while chances < num_chances
            input = gets.chomp.to_i
            if input < x
                scroll("Too low!")
                scroll("--------------------------------------------", 0.01)
                if chances < num_chances - 1
                    scroll("You have #{num_chances - chances - 1} chances left.")
                    scroll("Guess again!")
                else
                    scroll("You're out of luck.  Neck slashing time!")
                    return false
                end
            elsif input > x
                scroll("Too high!")
                scroll("--------------------------------------------", 0.01)
                if chances < num_chances - 1
                    scroll("You have #{num_chances - chances - 1} chances left.")
                    scroll("Guess again!")
                else
                    scroll("You're out of luck.  Neck slashing time!")
                    return false
                end
            elsif input == x
                scroll "You win! Enjoy having a neck!"
                return true
            end
            chances += 1
        end
    end
    
    scroll(intro)
    scroll("--------------------------------------------", 0.001)
    guessing_game(chance_max)
end
# sword_game_mini