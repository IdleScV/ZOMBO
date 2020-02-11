require_relative '../../config/environment'
require_relative '../components/choose_weapon.rb'
require 'pry'


def scroll(text, mili_s=0.00)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end

def line
    puts  " "
end

def minigame(weapon_obj)
    case weapon_obj["weapon_name"]
        when "knife"
            knife_game
        when "gun"
            gun_game
        when "sword"
            sword_game
        when "rope"
            rope_game
        when "candlestick"
            candlestick_game
    end
end

def knife_game
    line
    #! Create mini game code here





    scroll("You lose this round . . .")
    return false
end

def gun_game
    line
    #! Create mini game code here





    scroll("You win this round . . .")
    return true
end

def sword_game
    line
    #! Create mini game code here





    scroll("You lose")
    return false
end

def rope_game
    line
    #! Create mini game code here





    scroll("You lose")
    return false
end

def candlestick_game
    line
    #! Create mini game code here





    scroll("You lose")
    return false
end
