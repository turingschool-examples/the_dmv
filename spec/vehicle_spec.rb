require 'spec_helper'
require 'date'

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

  describe '#registration_fee' do
    it 'calculates registration fee' do

      expect(@camaro.registration_fee(@camaro)).to eq(25)
      expect(@bolt.registration_fee(@bolt)).to eq(200)
      expect(@cruz.registration_fee(@cruz)).to eq (100)
    end
  end

  describe Vehicle do
    let(:vehicle) do
      Vehicle.new(
        engine: :ev,
        make: "TOYOTA",
        model: "Prius Plug-in",
        vin: "JTDKN3DP8D",
        year: "2013"
      )
    end

    it 'creates a Vehicle with the correct attributes' do
      expect(vehicle.engine).to eq(:ev)
      expect(vehicle.make).to eq("TOYOTA")
      expect(vehicle.model).to eq("Prius Plug-in")
      expect(vehicle.vin).to eq("JTDKN3DP8D")
      expect(vehicle.year).to eq("2013")
    end
  end
end
