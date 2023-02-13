require_relative 'spec_helper'

RSpec.describe Monster do
  describe '#initialize' do
    it 'exists' do
      monster_data = {"name": "Aboleth", "Armor Class": "17", "Hit Points": "135", "Speed": "10 ft", "STR": "21", "DEX": "9", "CON": "15", "INT": "18", "WIS": "15", "CHA": "18", "Languages": "Deep Speech", "Challenge": "10"}
      monster_1 = Monster.new(monster_data)
      
      expect(monster_1).to be_instance_of(Monster)
    end
  end
  
  it 'has attributes' do
    monster_data = {"name": "Aboleth", "Armor Class": "17", "Hit Points": "135", "Speed": "10 ft", "STR": "21", "DEX": "9", "CON": "15", "INT": "18", "WIS": "15", "CHA": "18", "Languages": "Deep Speech", "Challenge": "10"}
    monster_1 = Monster.new(monster_data)

    expect(monster_1.name).to eq("Aboleth")
    expect(monster_1.armour_class).to eq(17)
    expect(monster_1.hit_points).to eq(135)
    expect(monster_1.speed).to eq("10 ft")
    expect(monster_1.strength).to eq("21")
    expect(monster_1.challenge).to eq("10")
  end

  it 'can take_damage' do
    monster_data = {"name": "Aboleth", "Armor Class": "17", "Hit Points": "135", "Speed": "10 ft", "STR": "21", "DEX": "9", "CON": "15", "INT": "18", "WIS": "15", "CHA": "18", "Languages": "Deep Speech", "Challenge": "10"}
    monster_1 = Monster.new(monster_data)

    monster_1.take_damage(17, 35)

    expect(monster_1.hit_points).to eq(100)
  end
end