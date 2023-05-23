require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @cruz_2 = Vehicle.new({vin: '123456789abcdefgh', model_year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt_2 = Vehicle.new({vin_10_1: '987654321abcdefgh', model_year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@camaro).to be_an_instance_of(Vehicle)

    end

    it 'takes data from a hash' do
      
      expect(@cruz.vin).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to eq(nil)
      
    end

    it 'can take data from a hash with diffrent keys' do

      expect(@cruz_2.vin).to eq('123456789abcdefgh')
      expect(@cruz_2.year).to eq(2012)
      expect(@cruz_2.make).to eq('Chevrolet')
      expect(@cruz_2.model).to eq('Cruz')

      expect(@bolt_2.vin).to eq('987654321abcdefgh')
      expect(@bolt_2.year).to eq(2019)
      expect(@bolt_2.make).to eq('Chevrolet')
      expect(@bolt_2.model).to eq('Bolt')
    end

    it 'can hold a registration date that defaults to nil' do
      
      expect(@cruz.registration_date).to eq(nil)
      expect(@bolt.registration_date).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)
    end

    it 'can hold a plate_type that defaults to nil' do

      expect(@cruz.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
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

  describe '#add_registration' do

    it 'Can add a registration date' do

      expect(@cruz.registration_date).to eq(nil)
      expect(@bolt.registration_date).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)

      @cruz.add_registration
      expect(@cruz.registration_date).to be_a(Integer)
      expect(@bolt.registration_date).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)
      
      @bolt.add_registration
      expect(@cruz.registration_date).to be_a(Integer)
      expect(@bolt.registration_date).to be_a(Integer)
      expect(@camaro.registration_date).to eq(nil)
      
    end
  end

  describe '#add_plate' do
    it 'can add a plate type' do

      expect(@cruz.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      
      @cruz.add_plate(:regular)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)

      @bolt.add_plate(:ev)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(nil)
    end
  end
end
