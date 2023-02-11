require 'spec_helper'

RSpec.describe Vehicle do
  CAR_1 = {
    vin: '123456789abcdefgh',
    year: 2012,
    make: 'Chevrolet',
    model: 'Cruz',
    engine: :ice
  }.freeze
  CAR_2 = {
    vin: '987654321abcdefgh',
    year: 2019,
    make: 'Chevrolet',
    model: 'Bolt',
    engine: :ev
  }.freeze
  CAR_3 = {
    vin: '1a2b3c4d5e6f',
    year: 1969,
    make: 'Chevrolet',
    model: 'Camaro',
    engine: :ice
  }.freeze

  before(:each) do
    @cruz = Vehicle.new(CAR_1)
    @bolt = Vehicle.new(CAR_2)
    @camaro = Vehicle.new(CAR_3)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq(CAR_1[:vin])
      expect(@cruz.year).to eq(CAR_1[:year])
      expect(@cruz.make).to eq(CAR_1[:make])
      expect(@cruz.model).to eq(CAR_1[:model])
      expect(@cruz.engine).to eq(CAR_1[:engine])
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'can initialize a different car' do
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@bolt.vin).to eq(CAR_2[:vin])
      expect(@bolt.year).to eq(CAR_2[:year])
      expect(@bolt.make).to eq(CAR_2[:make])
      expect(@bolt.model).to eq(CAR_2[:model])
      expect(@bolt.engine).to eq(CAR_2[:engine])
      expect(@bolt.registration_date).to eq(nil)
    end

    it 'can initialize a different car again' do
      expect(@camaro).to be_an_instance_of(Vehicle)
      expect(@camaro.vin).to eq(CAR_3[:vin])
      expect(@camaro.year).to eq(CAR_3[:year])
      expect(@camaro.make).to eq(CAR_3[:make])
      expect(@camaro.model).to eq(CAR_3[:model])
      expect(@camaro.engine).to eq(CAR_3[:engine])
      expect(@camaro.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'returns false if a vehicle is not older than 25 years old' do
      expect(@cruz.antique?).to eq(false)
      expect(@bolt.antique?).to eq(false)
    end

    it 'returns true if a vehicle is older than 25 years old' do
      expect(@camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'returns false if a vehicle is not an electric vehicle' do
      expect(@cruz.electric_vehicle?).to eq(false)
      expect(@camaro.electric_vehicle?).to eq(false)
    end

    it 'returns true if a vehicle is an electric vehicle' do
      expect(@bolt.electric_vehicle?).to eq(true)
    end
  end

  describe '#plate_type' do
    it 'has a plate type' do
      expect(@cruz.plate_type).to be(:regular)
    end

    it 'the plate type is a symbol' do
      expect(@cruz.plate_type).to be_a(Symbol)
    end

    it 'can have a :regular plate type' do
      expect(@cruz.plate_type).to be(:regular)
    end

    it 'can have an :ev plate type' do
      expect(@bolt.plate_type).to be(:ev)
    end

    it 'can have an :antique plate type' do
      expect(@camaro.plate_type).to be(:antique)
    end
  end
end
