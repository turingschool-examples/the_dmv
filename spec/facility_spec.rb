require 'spec_helper'
require './lib/facility'
require './lib/vehicle'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])

      expect(@facility_2.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
    it 'can add available services to another facility' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end
  end

  describe '#registered_vehicles' do
    it 'returns an empty array when an instance is created' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do
    it "returns a 0 value when instance is initiated" do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it "can add fees after registering vehicles" do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(125)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe '#register_vehicle' do
    it "adds a vehicle to the facility's registered vehicles" do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).not_to eq([])
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.registered_vehicles).to eq([@cruz,@camaro])
      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz,@camaro,@bolt])
    end

    it "does not register a vehicle when the service is not available" do
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.collected_fees).to eq(0)
    end
  end

  describe '#administer_written_test' do
    it "returns the current_data when service has not been activated" do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
    end

    it "returns true when using the method if service is activated" do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it "only gives a written test when all conditions are met" do
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
      @facility_1.add_service('Written Test')
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
  end



end
