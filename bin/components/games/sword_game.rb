require_relative '../../../config/environment'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def zombie
    Zombie.where({alive: true})[0]
end

def chance_adjuster
    if zombie.health <= 5
        return 10
    elsif zombie.health == 6
        return 9
    elsif zombie.health == 7
        return 9
    elsif zombie.health == 8
        return 8
    elsif zombie.health == 9
        return 8
    else
        return 7
    end
end

def sword_game_mini
    chance_max = chance_adjuster
    intro = <<-INFO
You've chosen to live life on the edge and face the zombie with a sword.
Guess the zombie's favorite number from 1 to 100 before he overpowers you and slashes your neck!
You have #{chance_max} guesses.
    INFO

    def guessing_game(num_chances)
        puts "Choose a number between 1 and 100.".colorize(:magenta)
        x = rand(1..100)
        chances = 0
        while chances < num_chances
            input = gets.chomp.to_i
            if input < x
                scroll("Too low!".colorize(:magenta))
                scroll("--------------------------------------------", 0.01)
                if chances < num_chances - 1
                    scroll("You have #{num_chances - chances - 1} chances left.".colorize(:magenta))
                    scroll("Guess again!".colorize(:green))
                else
                    scroll("You're out of luck.  Neck slashing time!".colorize(:blue))
                    return false
                end
            elsif input > x
                scroll("Too high!".colorize(:magenta))
                scroll("--------------------------------------------", 0.01)
                if chances < num_chances - 1
                    scroll("You have #{num_chances - chances - 1} chances left.".colorize(:magenta))
                    scroll("Guess again!".colorize(:green))
                else
                    scroll("============================================")
                    scroll("           You're out of luck.                      ".colorize(:blue))
                    scroll("#{zombie.name}:                    ")
                    scroll("           Neck slashing time!           ".colorize(:blue))
                    
                    return false
                end
            elsif input == x
              
                scroll("============================================")
                scroll("        You win! Enjoy having a neck!                      ".colorize(:blue))
                scroll("#{zombie.name} says...                    ".colorize(:blue))
                scroll("         Nooo! WHAT ABOUT MY NECK?!            ".colorize(:blue))
                
                return true
            end
            chances += 1
        end
    end
    
    scroll(intro.colorize(:blue))
    scroll("============================================", 0.001)
    guessing_game(chance_max)
end
# sword_game_mini