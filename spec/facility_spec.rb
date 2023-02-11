require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new(FACILITY_1)
    @facility_2 = Facility.new(FACILITY_2)

    @cruz = Vehicle.new(CRUZ)
    @bolt = Vehicle.new(BOLT)
    @camaro = Vehicle.new(CAMARO)
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

    it 'does not register the vehicle if the service is not included' do
      expect(@facility_2.registered_vehicles).to eq([])
      @facility_2.register_vehicle(@cruz)
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'does not collect a fee if the service is not included' do
      expect(@facility_2.collected_fees).to eq(0)
      @facility_2.register_vehicle(@cruz)
      expect(@facility_2.collected_fees).to eq(0)
    end

    it 'returns nil if the service is not included' do
      expect(@facility_2.register_vehicle(@cruz)).to be(nil)
    end
  end

  describe '#administer_written_test' do
    before(:each) do
      @facility_1.add_service('Written Test')

      @registrant_1 = Registrant.new(REGISTRANT_1[:name], REGISTRANT_1[:age], REGISTRANT_1[:permit])
      @registrant_2 = Registrant.new(REGISTRANT_2[:name], REGISTRANT_2[:age])
      @registrant_3 = Registrant.new(REGISTRANT_3[:name], REGISTRANT_3[:age])
    end

    it 'does not do modify anything if there is no written test service' do
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq(Registrant::DEFAULTS[:license_data])
    end

    it 'returns false if there is no written test service' do
      expect(@facility_2.administer_written_test(@registrant_1)).to be(false)
    end

    it 'does not do modify anything if the registrant does not have a permit' do
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_2.license_data).to eq(Registrant::DEFAULTS[:license_data])
      expect(@registrant_3.license_data).to eq(Registrant::DEFAULTS[:license_data])
    end

    it 'returns false if the registrant does not have a permit' do
      expect(@facility_1.administer_written_test(@registrant_2)).to be(false)
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
    end

    it 'does not do modify anything if the registrant is under 16 years old' do
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data).to eq(Registrant::DEFAULTS[:license_data])
    end

    it 'returns false if the registrant is under 16 years old' do
      expect(@facility_1.administer_written_test(@registrant_3)).to be(false)
    end

    it 'correctly modifies the registrant\' license data if it successfully administers the written test' do
      expect(@facility_2.services).to eq([])
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq(Registrant::DEFAULTS[:license_data])
      @facility_2.add_service('Written Test')
      @facility_2.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to be(true)
    end

    it 'returns true if it successfully administers the written test' do
      expect(@facility_1.administer_written_test(@registrant_1)).to be(true)
    end
  end
end
