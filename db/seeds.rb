require 'faker'

Character.destroy_all
Weapon.destroy_all
Zombie.destroy_all
Fight.destroy_all

5.times {
Character.create(name: Faker::Name.name, catchphrase: Faker::TvShows::MichaelScott.quote, health: 10, alive: 1)
}


Weapon.create(weapon_name: "knife", strength: 4)
Weapon.create(weapon_name: "gun", strength: 8)
Weapon.create(weapon_name: "sword", strength: 7)
Weapon.create(weapon_name: "rope", strength: 1)
Weapon.create(weapon_name: "candlestick", strength: 10)

10.times {
Zombie.create(name: Faker::Games::Witcher.monster, catchphrase: Faker::TvShows::Community.quotes, health: rand(4..9), alive: 1)
}

p "finished seed"