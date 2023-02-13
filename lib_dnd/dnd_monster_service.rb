require 'faraday'
require 'json'

class MonsterService

  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def dnd_monsters
    @dnd_monsters ||= load_data('https://gist.githubusercontent.com/tkfu/9819e4ac6d529e225e9fc58b358c3479/raw/d4df8804c25a662efc42936db60cfbc0a5b19db8/srd_5e_monsters.json')
  end
end