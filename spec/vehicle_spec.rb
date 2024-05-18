require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @vehicle_factory = VehicleFactory.new
    @registrations = [
      {make: 'Tesla', model: 'Model S', vin_1_10: '5YJSA1CN', model_year: 2015},
      {make: 'Tesla', model: 'Model 3', vin_1_10: '5YJ3E1EA', model_year: 2018},
      {make: 'Tesla', model: 'Model X', vin_1_10: '5YJXCBEA', model_year: 2017}
    ]
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@bolt.electric_vehicle?).to eq(true)
      expect(@camaro.electric_vehicle?).to eq(false)
    end
  end

  describe '#registration_date' do
    it 'can parse the registration date' do
      expect(@cruz.registration_date).to eq(nil)
    end
  end

  describe '#register' do
    it 'can register a vehicle' do
      expect(@cruz.registration_date).to eq(nil)
      @cruz.register
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  describe '#regular?' do 
    it 'can determine if a vehicle is regular' do
      expect(@cruz.regular?).to eq(true)
      expect(@bolt.regular?).to eq(false)
      expect(@camaro.regular?).to eq(true)
    end
  end

  describe '#set_plate_type' do
    it 'can set the plate type' do
      expect(@cruz.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      @cruz.set_plate_type
      @bolt.set_plate_type
      @camaro.set_plate_type
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end
end
