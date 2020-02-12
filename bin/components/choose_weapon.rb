require_relative '../../config/environment'
require 'pry'

def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end


def list_available_weapons
    Weapon.all
end

def show_weapons
    list_available_weapons.each{|weapon| scroll(weapon["weapon_name"], 0.0) }
end

def weapon_choices
    show_weapons
    scroll("============================================")
    scroll("Type the name of your desired weapon . . . .")
    userinput = gets.chomp
    userinput
end

def pick_weapon
    userinput = weapon_choices
    chosen_weapon = Weapon.all.detect {|weapon| weapon["weapon_name"] == userinput}
end

def chosen_weapon
    scroll( "you've chosen " + pick_weapon["weapon_name"] )
end


def weapon_obj 
    pick_weapon
end


def create_fight(char_obj, zombie_obj)
    newfight = Fight.create(
        :character_id => char_obj.id,
        :zombie_id => zombie_obj.id,
       :weapon_id => weapon_obj.id
    )
    newfight.weapon
end