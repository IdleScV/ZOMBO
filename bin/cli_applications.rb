require_relative '../config/environment'
require 'pry'

def choose_character
    puts "Select your character..."
    character_names = Character.all.map{ |character_obj|
        character_obj[:name] }

    count = 0
    while count < character_names.length
        puts "#{count + 1}. #{character_names[count]}"
        count += 1
    end

    puts "Enter the number of your champion."
 
    input = gets.chomp.to_i

    new_count = input - 1
    puts "You've selected #{character_names[new_count]}"
    return character_names[new_count]

end

# choose_character