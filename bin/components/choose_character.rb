require_relative '../../config/environment'
require 'pry'

def scroll(text, mili_s=0.04)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end

def line
    puts  " "
end

def available_character_names
    arr = Character.all.map{ |character_obj|
        character_obj[:name] }

    arr
        #* Returns array of available names
end


def show_available_characters

    scroll("Here are your champion choices for today...")
    line

    character_names = available_character_names
    
    count = 0
    while count < character_names.length
        scroll("#{count + 1}. #{character_names[count]}", 0.02)
        line
        count += 1
    end
end


def choose_character
    

    show_available_characters
    line
    character_names = available_character_names

    scroll("Select your character...")
    line
    scroll("Enter the number of your champion.")
    line
    input = gets.chomp

    new_count = input.to_i - 1
    scroll("You've selected #{character_names[new_count]}")
    line
    character_name = character_names[new_count]
    character_obj = Character.all.detect{|char_obj| char_obj.name == character_name}

    return character_obj

end


# choose_character




