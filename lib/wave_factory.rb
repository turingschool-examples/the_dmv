class WaveFactory
  def initialize
    @wave_repository = []
  end
  
  def create_waves(api_data)
    api_data[:daily][:time].each_with_index do |time, i|
      data = {
        time: time,
        wave_height_max: api_data[:daily][:wave_height_max][i],
        wave_direction_dominant: api_data[:daily][:wave_direction_dominant][i],
        wave_period_max: api_data[:daily][:wave_period_max][i]
      }
      wave = IndividualWave.new(data)
      @wave_repository << wave
    end
    require 'pry';binding.pry
    @wave_repository
  end
  #require 'pry';binding.pry
end