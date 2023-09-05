class WaveFactory
  def initialize
    @wave_repository = []
  end
  
  def create_waves(api_data)
    api_data[:daily].each_with_index do |(k, wave_data), i|
      data = {
      time: api_data[:daily][:time][i],
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