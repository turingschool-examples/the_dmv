class IndividualWave
  attr_reader :hourly_units,:daily_units,:wave_height_max

  def initialize(wave_data)
    @time = wave_data[:time]
    @wave_height_max = wave_data[:wave_height_max]
    @wave_direction_dominant = wave_data[:wave_direction_dominant]
    @wave_period_max = wave_data[:wave_period_max]
  end
end