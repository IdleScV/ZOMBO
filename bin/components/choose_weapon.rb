require_relative '../../config/environment'
require 'pry'

def scroll(text, mili_s=0.04)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
end

def line
    puts  " "
end


def list_available_weapons
    Weapon.all
end

def show_weapons_with_stats
    list_available_weapons.each{|weapon| scroll(weapon["weapon_name"], 0.05) ; line}
end

def pick_weapon
    arr = list_available_weapons
    show_weapons_with_stats
    puts "Select weapon type."
    userinput = gets.chomp
    
    chosen_weapon = arr.detect {|weapon| weapon["weapon_name"] == userinput}
    scroll( "you've chosen " + chosen_weapon["weapon_name"] )
    chosen_weapon  
end

