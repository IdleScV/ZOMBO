require_relative '../../config/environment'
require 'pry'
require 'colorize' 
require 'colorized_string'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end



def input_result(result, character_obj, zombie_obj)
    if result == false
        Fight.last.update(win: false)
        character_obj.update(alive: false) 
        scroll("Your friend " + character_obj["name"] + " is dead.".colorize(:red))
    else
        Fight.last.update(win: true)
        zombie_obj.update(alive: false) 
        scroll(zombie_obj["name"] + " the zombie is dead.".colorize(:red))
    end
end

