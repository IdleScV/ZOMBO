require_relative '../../../config/environment'
require "pry"
require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

def rope_game_mini

    #? Gets name of current zombie
    def zombie
        Zombie.where({alive: true})[0]
    end

    #? Creating a word and our blank array
    word = Faker::Creature::Animal.name
    wordarr = word.downcase.split('')
    blankarr = []
    wordarr.length.times{
        blankarr << "__"
    }

    #? Our Introduction to how the game is played
    breaker = "============================================"
    intro = ["You have chosen to fight #{zombie["name"]} with a rope. . . .",
    "Excellent choice?",
    "Guess the correct animal to kill the zombie",
    "Your animal is #{word.length} letters long."]
    step1 = "Please choose a letter from 'a' to 'z'"

    #? Method that allows the game to be played.
    def changeword(wordarr, blankarr)
        char = gets.chomp
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
        p blankarr
        puts breaker
        p blankarr
        #? Chances is 6
        chances = 6
        count = 0
        
        while count < chances do
            scroll(step1)
            scroll( "You have #{chances - count} chances left")
            #? wrong guess will increase count by 1

            # p word #! Testing
            change = changeword(wordarr, blankarr)
            if change == false
                count += 1
            end
            # ! Win 
            if blankarr.join('') == wordarr.join('')
                puts (' ')
                puts (' ')
                scroll("                            You did it!             ")
                puts (' ')
                scroll("You have wrangled #{zombie.name} to death with your excellent roping skills!")
                return true
            end        
        end
    # ! Lost
    puts (' ')
    puts (' ')
    scroll("You have lost! the animal was #{wordarr.join('')}. . . .")
    puts (' ')
    scroll("You have been wrangled #{zombie.name} to death by your own rope.")
    
    return false
end

puts rope_game_mini