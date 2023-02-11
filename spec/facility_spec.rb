require 'spec_helper'

RSpec.describe Facility do
  FACILITY_1 = {
    name: 'Albany DMV Office',
    address: '2242 Santiam Hwy SE Albany OR 97321',
    phone: '541-967-2014'
  }.freeze
  FACILITY_2 = {
    name: 'Ashland DMV Office',
    address: '600 Tolman Creek Rd Ashland OR 97520',
    phone: '541-776-6092'
  }.freeze

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
    @facility_1 = Facility.new(FACILITY_1)
    @facility_2 = Facility.new(FACILITY_2)

    @cruz = Vehicle.new(CAR_1)
    @bolt = Vehicle.new(CAR_2)
    @camaro = Vehicle.new(CAR_3)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq(FACILITY_1[:name])
      expect(@facility_1.address).to eq(FACILITY_1[:address])
      expect(@facility_1.phone).to eq(FACILITY_1[:phone])
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end

    it 'can initialize again' do
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq(FACILITY_2[:name])
      expect(@facility_2.address).to eq(FACILITY_2[:address])
      expect(@facility_2.phone).to eq(FACILITY_2[:phone])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#add_service' do
    before(:each) do
      expect(@facility_1.services).to eq([])
      expect(@facility_2.services).to eq([])
    end

    it 'can add 1 service' do
      @facility_1.add_service('New Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License'])
    end

    it 'can add 2 services' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License'])
    end

    it 'can add 3 services' do
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end

    it 'returns an array of strings' do
      expect(@facility_1.services).to be_a(Array)
      expect(@facility_1.services.all? { |service| service.is_a?(String) }).to be(true)
    end
  end

  describe '#registered_vehicles' do
    it 'returns an array' do
      expect(@facility_1.registered_vehicles).to be_a(Array)
      expect(@facility_2.registered_vehicles).to be_a(Array)
    end

    it 'starts empty' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do
    before(:each) do
      @facility_1.add_service('Vehicle Registration')
    end

    it 'returns an integer' do
      expect(@facility_1.collected_fees).to be_a(Integer)
      expect(@facility_2.collected_fees).to be_a(Integer)
    end

    it 'starts at 0' do
      expect(@facility_1.collected_fees).to eq(0)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'collects $25 for an antique vehicle being registered' do
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collects $100 for a regular vehicle being registered' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'collects $200 for an electric vehicle being registered' do
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'collects multiple fees' do
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#register_vehicle' do
    before(:each) do
      @facility_1.add_service('Vehicle Registration')
    end

    it 'adds a vehicle to the registered vehicle list' do
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'adds multiple vehicles to the registered vehicle list' do
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt])
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
    end

    it 'returns the registered vehicle list' do
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @bolt])
      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @bolt, @camaro])
    end

    it 'adds today\'s date to the vehicle\'s registration date' do
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@camaro.registration_date).to eq(Date.today)
    end
  end
end
