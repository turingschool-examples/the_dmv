require 'spec_helper'

RSpec.describe Wave do
  before(:each) do
    @wave = Wave.new
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@wave).to be_an_instance_of(Wave)
    end
  end

  describe '#load_data' do
    it 'can load data from a given source' do
      source = 'https://marine-api.open-meteo.com/v1/marine?latitude=34.2783&longitude=-119.2932&hourly=wave_height&daily=wave_height_max,wave_direction_dominant,wave_period_max&timezone=America%2FLos_Angeles&past_days=92'
      data_response = @wave.load_data(source)
      expect(data_response).to be_an_instance_of(Hash)
      expect(data_response.size).to be_an(Integer)
    end
  end

  describe '#wave_api' do
    it 'can load wave_api data' do
      expect(@wave.wave_api.size).to be_an(Integer)
    end
  end

  describe '#extract wave_api data' do
    it 'can create object-instances of wave_api data' do
      wave = Wave.new.wave_api
      @wave_factory = WaveFactory.new
      vent_waves = @wave_factory.create_waves(wave)
      vent_waves.each do |vw|
      expect(vw).to be_a(IndividualWave)
      expect(vw.wave_height_max).not_to eq(nil)
      end
    end
  end

end