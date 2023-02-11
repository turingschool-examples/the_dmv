require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @car_1 = {
      vin: '123456789abcdefgh',
      year: 2012,
      make: 'Chevrolet',
      model: 'Cruz',
      engine: :ice
    }
    @car_2 = {
      vin: '987654321abcdefgh',
      year: 2019,
      make: 'Chevrolet',
      model: 'Bolt',
      engine: :ev
    }
    @car_3 = {
      vin: '1a2b3c4d5e6f',
      year: 1969,
      make: 'Chevrolet',
      model: 'Camaro',
      engine: :ice
    }

    @cruz = Vehicle.new(@car_1)
    @bolt = Vehicle.new(@car_2)
    @camaro = Vehicle.new(@car_3)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@cruz).to be_an_instance_of(Vehicle)
      expect(@cruz.vin).to eq(@car_1[:vin])
      expect(@cruz.year).to eq(@car_1[:year])
      expect(@cruz.make).to eq(@car_1[:make])
      expect(@cruz.model).to eq(@car_1[:model])
      expect(@cruz.engine).to eq(@car_1[:engine])
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'can initialize a different car' do
      expect(@bolt).to be_an_instance_of(Vehicle)
      expect(@bolt.vin).to eq(@car_2[:vin])
      expect(@bolt.year).to eq(@car_2[:year])
      expect(@bolt.make).to eq(@car_2[:make])
      expect(@bolt.model).to eq(@car_2[:model])
      expect(@bolt.engine).to eq(@car_2[:engine])
      expect(@bolt.registration_date).to eq(nil)
    end

    it 'can initialize a different car again' do
      expect(@camaro).to be_an_instance_of(Vehicle)
      expect(@camaro.vin).to eq(@car_3[:vin])
      expect(@camaro.year).to eq(@car_3[:year])
      expect(@camaro.make).to eq(@car_3[:make])
      expect(@camaro.model).to eq(@car_3[:model])
      expect(@camaro.engine).to eq(@car_3[:engine])
      expect(@camaro.registration_date).to eq(nil)
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
end
