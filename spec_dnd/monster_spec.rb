require './spec_dnd/spec_helper'

RSpec describe Monster do
  before(:each) do
    monster_data = {"name": "Aboleth", "Armor Class": "17", "Hit Points": "135", "Speed": "10 ft", "STR": "21", "DEX": "9", "CON": "15", "INT": "18", "WIS": "15", "CHA": "18", "Languages": "Deep Speech", "Challenge": "10"}
  end

  it 'exists' do
    monster_1 = Monster.new(monster_data)

    expect(monster_1).to be_instance_of(Monster)
  end
end