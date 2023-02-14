class Monster
  attr_reader :name, 
              :armour_class,
              :hit_points,
              :speed,
              :strength,
              :dexterity, 
              :constitution, 
              :intelligence, 
              :wisdom,
              :charisma,
              :languages,
              :challenge, 
              :alive
  def initialize(monster_data)
    @name = monster_data[:"name"]
    @armour_class = monster_data[:"Armor Class"].to_i
    @hit_points = monster_data[:"Hit Points"].to_i
    @speed = monster_data[:"Speed"]
    @strength = monster_data[:"STR"]
    @dexterity = monster_data[:"DEX"]
    @constitution = monster_data[:"CON"]
    @intelligence = monster_data[:"INT"]
    @wisdom = monster_data[:"WIS"]
    @charisma = monster_data[:"CHA"]
    @languages = monster_data[:"Languages"]
    @challenge = monster_data[:"Challenge"]
    @alive = @hit_points > 0
  end

  def take_damage(roll_to_hit, damage)
    if roll_to_hit >= @armour_class
      @hit_points -= damage
    end
  end
end