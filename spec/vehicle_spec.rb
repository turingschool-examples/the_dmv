require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
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

  describe '#set_plate_type' do
    it 'sets correct plate type for antique vehicles' do
      expect(@camaro.plate_type).to eq(nil)
      @camaro.set_plate_type
      expect(@camaro.plate_type).to eq(:antique)
    end

    it 'sets correct plate type for electric vehicles' do
      expect(@bolt.plate_type).to eq(nil)
      @bolt.set_plate_type
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'sets correct plate type for regular vehicles' do
      expect(@cruz.plate_type).to eq(nil)
      @cruz.set_plate_type
      expect(@cruz.plate_type).to eq(:regular)
    end
  end

  describe '#set_registration_date' do
    it 'can set a registration date' do
      expect(@camaro.registration_date).to eq(nil)
      @camaro.set_registration_date
      expect(@camaro.registration_date).to be_an_instance_of(Date)
    end
  end
end
