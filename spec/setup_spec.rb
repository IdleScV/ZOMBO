require 'spec_helper'

describe Character do

    it "returns 5 characters when initially seeded 'Character.count'" do
        expect(Character.count).to equal(5)
    end
end

describe Zombie do
    
    it "returns 10 zombies when initially seeded 'Zombie.all'" do
        expect(Zombie.count).to equal(10)
    end
end

describe Weapon do
    it "returns 5 weapons when initially seeded 'Weapon.all'" do
        expect(Weapon.count).to equal(5)
    end

    it "returns 'knife' when first item is called" do
        expect(Weapon.first[:weapon_name]).to eq('knife')
    end

    it "returns 'candlestick' when first last is called" do
        expect(Weapon.last[:weapon_name]).to eq('candlestick')
    end
end

