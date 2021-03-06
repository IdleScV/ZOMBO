require 'faker'
require 'colorize' 
require 'colorized_string'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

Character.destroy_all
Weapon.destroy_all
Zombie.destroy_all
Fight.destroy_all

5.times {
Character.create(name: Faker::TvShows::Friends.character, catchphrase: Faker::TvShows::MichaelScott.quote, alive: 1)
}


Weapon.create(weapon_name: "knife")
Weapon.create(weapon_name: "gun")
Weapon.create(weapon_name: "sword")
Weapon.create(weapon_name: "rope")
Weapon.create(weapon_name: "candlestick")


Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 5, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 5, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 6, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 6, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 7, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 7, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 8, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 8, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 9, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: 10, alive: 1)


scroll( "       A new game has been rendered")
scroll("--------------------------------------------")
scroll("There are #{Character.count} new Champions, ".colorize(:light_white))
scroll("                          and #{Zombie.count} new Zombies".colorize(:light_white))
scroll("--------------------------------------------")