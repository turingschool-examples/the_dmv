require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @cruz = Vehicle.new(CRUZ)
    @bolt = Vehicle.new(BOLT)
    @camaro = Vehicle.new(CAMARO)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq(CRUZ[:vin])
      expect(@cruz.year).to eq(CRUZ[:year])
      expect(@cruz.make).to eq(CRUZ[:make])
      expect(@cruz.model).to eq(CRUZ[:model])
      expect(@cruz.engine).to eq(CRUZ[:engine])
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'can initialize a different car' do
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@bolt.vin).to eq(BOLT[:vin])
      expect(@bolt.year).to eq(BOLT[:year])
      expect(@bolt.make).to eq(BOLT[:make])
      expect(@bolt.model).to eq(BOLT[:model])
      expect(@bolt.engine).to eq(BOLT[:engine])
      expect(@bolt.registration_date).to eq(nil)
    end

    it 'can initialize a different car again' do
      expect(@camaro).to be_an_instance_of(Vehicle)
      expect(@camaro.vin).to eq(CAMARO[:vin])
      expect(@camaro.year).to eq(CAMARO[:year])
      expect(@camaro.make).to eq(CAMARO[:make])
      expect(@camaro.model).to eq(CAMARO[:model])
      expect(@camaro.engine).to eq(CAMARO[:engine])
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
