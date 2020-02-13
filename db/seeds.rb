require 'faker'
def scroll(text, mili_s=0.03)
    text.each_char{|c| putc c ; sleep mili_s; $stdout.flush }
    puts " "
end

Character.destroy_all
Weapon.destroy_all
Zombie.destroy_all
Fight.destroy_all

5.times {
Character.create(name: Faker::TvShows::Friends.character, catchphrase: Faker::TvShows::MichaelScott.quote, health: 10, alive: 1)
}


Weapon.create(weapon_name: "knife", strength: 1)
Weapon.create(weapon_name: "gun", strength: 3)
Weapon.create(weapon_name: "sword", strength: 20)
Weapon.create(weapon_name: "rope", strength: 3)
Weapon.create(weapon_name: "candlestick", strength: 2)


Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 1, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 2, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 3, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 4, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 5, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 6, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 7, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 8, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 9, alive: 1)
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::DumbAndDumber.quote, health: 10, alive: 1)


scroll( "       A new game has been rendered")
scroll("--------------------------------------------")
scroll("There are #{Character.count} new Champions, ")
scroll("                          and #{Zombie.count} new Zombies")
scroll("--------------------------------------------")