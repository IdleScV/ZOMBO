require_relative '../../config/environment'
require 'pry'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end


def alive_characters 
    arr = Character.where({alive: true})

    arr
end

def available_character_names
    alive_characters.map{|char| char["name"]}
        #* Returns array of available names
end


def show_available_characters
    scroll("Here are your champion choices for today...")
    character_names = available_character_names
    count = 0
    while count < character_names.length
        scroll("#{count + 1}. #{character_names[count]}")
        count += 1
    end
end

def get_input(names)
    scroll("Enter the number of your champion.")
    input = gets.chomp.to_i
    if input < 6
        index = input - 1
        character_name = names[index]
        character_obj = Character.all.detect{|char_obj| char_obj.name == character_name}
        scroll("Hello, my name is #{names[index]}.  Whenever I'm down, I always remember my favorite motto: #{character_obj.catchphrase}", 0.02)
    else
        puts "You've entered an incorrect value."
        get_input(available_character_names)
    end
    return character_obj
end

def choose_character
    show_available_characters
    scroll("Select your character...")
    scroll("============================================")

    get_input(available_character_names)
end

# choose_character






