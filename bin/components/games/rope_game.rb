require_relative '../../../config/environment'
require "pry"
require 'faker'
def scroll(text, mili_s=0.009)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end


def line
    puts  " "
end

def rope_game_mini
    def zombie
        Zombie.where({alive: true})[0]
    end

    word = Faker::Creature::Animal.name
    wordarr = word.downcase.split('')
    blankarr = []
    wordarr.length.times{
        blankarr << "__"
    }

    breaker = "====================================================================="
    intro = ["You have chosen to fight #{zombie["name"]} with a rope. . . .",
    "Excellent choice?",
    "Guess the correct animal to kill the zombie",
    "Your animal is #{word.length} letters long."]

    step1 = "Please choose a letter from A to Z"


    def changeword( wordarr, blankarr)
        # ? Returns an array of index
        # indexes = wordarr.map.with_index{|a, i| a==char ? i : nil }.compact
        char = gets.chomp
        input = char.downcase
        indexes = wordarr.each_index.select{|i| wordarr[i] == input}
        if indexes.length > 0
            count = 0
            while count < indexes.length do
                scroll(input + " is in the word!")
                line
                blankarr[indexes[count]] = input

                count+=1
            end
        else 
            scroll("#{input} is not a character in the word")
            
            line

        end

        p blankarr
    end


    

    puts breaker
    intro.map{|x| scroll(x); line }
    puts breaker
    chances = wordarr.length + 5
    count = 0
    while count < chances do
        scroll( step1)
        line
        scroll( "You have #{chances - count } chances left")
        line
        changeword(wordarr, blankarr)
        # ! Win condition
        if blankarr.join('') == wordarr.join('')
            scroll( "You did it!")
            line
            return true
        end

        count += 1
    end
    # ! Lost
    scroll( "You have lost! the animal was #{wordarr.join('')}. . . .")
    line
    return false


end


rope_game_mini