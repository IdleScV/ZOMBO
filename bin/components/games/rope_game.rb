require_relative '../../../config/environment'
require "pry"
require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def zombie
    Zombie.where({alive: true})[0]
end

def chance_adjuster
    if zombie.health <= 5
        return 7
    elsif zombie.health == 6
        return 6
    elsif zombie.health == 7
        return 6
    elsif zombie.health == 8
        return 5
    elsif zombie.health == 9
        return 4
    else
        return 3
    end
end

def rope_game_mini

    #? Gets name of current zombie

    #? Creating a word and our blank array
    word = Faker::Creature::Animal.name
    wordarr = word.downcase.split('')
    blankarr = []
    wordarr.length.times{
        blankarr << "__"
    }
    wrong_letter = []
    #? Our Introduction to how the game is played
    breaker = "============================================"
    intro = ["You have chosen to fight #{zombie["name"]} with a rope. . . .",
    "Excellent... choice?",
    "Guess the correct animal to kill the zombie.",
    "Your animal is #{word.length} letters long."]
    step1 = "Please choose a letter from 'a' to 'z'."

    #? Method that allows the game to be played.
    def changeword(wordarr, blankarr, wrong_letter)
        char = gets.chomp
        puts " "
        input = char.downcase
        indexes = wordarr.each_index.select{|i| wordarr[i] == input}
            #? action if letter guessed is right
            if indexes.length > 0
                count = 0
                while count < indexes.length do
                    scroll(input + " is in the word!")
                    blankarr[indexes[count]] = input
                    count+=1
                    scroll("============================================", 0.005)
                    p blankarr
                end
                return true
            #? action if letter guessed is false
            else
                wrong_letter << input + " "
                scroll("'#{input}' is not a letter in the word")
                scroll("============================================", 0.005)
                p blankarr
                return false
            end
        #? Returns the blank array with correct
        
    end

    #? Game start
        #? Game Intro
        puts breaker
        intro.map{|x| scroll(x)}
        puts breaker
        
        p blankarr
        #? Chances is 6
        chances = chance_adjuster
        count = 0
        
        while count < chances do
            scroll(step1)
            scroll( "You have #{chances - count} lives left.")

            if wrong_letter.length > 0
                puts ("wrong guesses . . . " + wrong_letter.join(''))
                
            end
            
            puts (" ")
            #? wrong guess will increase count by 1

            # p word #! Testing
            change = changeword(wordarr, blankarr, wrong_letter)
            if change == false
                count += 1
            end
            # ! Win 
            if blankarr.join('') == wordarr.join('')
                scroll("============================================")
                scroll("                You did it! ")
                scroll("You have wrangled #{zombie.name} to death")
                scroll("with your excellent roping skills!")
               
                return true
            end        
        end
    # ! Lost

    scroll("============================================")
    scroll("              You have lost! ")
    scroll("the animal was #{wordarr.join('')}")
    scroll("#{zombie.name} is going to sick the #{wordarr.join('')} on your friend.")
    
    return false
end

# puts rope_game_mini