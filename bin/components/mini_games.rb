require_relative '../../config/environment'
require_relative '../components/choose_weapon.rb'
require_relative './games/candlestick_game.rb'
require_relative './games/gun_game.rb'
require_relative './games/knife_game.rb'
require_relative './games/rope_game.rb'
require_relative './games/sword_game.rb'
require 'pry'


def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
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
    knife_game_mini
end

def gun_game
    gun_game_mini
end

def sword_game
    
    sword_game_mini
end

def rope_game
    rope_game_mini
end

def candlestick_game
    
    #! Create mini game code here





    scroll("You lose")
    return false
end
