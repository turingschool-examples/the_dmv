require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 16)
    @registrant_3 = Registrant.new('Tucker', 15 )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
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
  end

  describe '#registered_vehicles' do
    it 'can keep track of vehicles registered' do
      expect(@facility.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do
    it 'can keep track of collected_fees' do
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do
    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles.count).to eq(1)
    end

    it 'can add a registration date to a vehicle' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(DateTime)
    end

    it 'adds 100 everytime a vehicle is registered' do
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(@cruz)
      expect(@facility.collected_fees).to eq(100)
    end

    it 'does not register a vehicle if the service is not listed' do
      facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )

      expect(facility_2.services).to eq([])
      expect(facility_2.register_vehicle(bolt)).to eq(nil)
    end
  end

  describe '#administer_written_test' do
    it 'can tell if a facility offers the service or not' do
      expect(@facility.administer_written_test(@registrant_1)).to eq(false)
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(@registrant_1)).to eq(true)
    end

    it 'can administer a written test if the facility offers the service' do
      @facility.add_service('Written Test')
      @facility.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'can check if the registrant has a permit or not' do
      @facility.add_service('Written Test')
      expect(@registrant_2.permit?).to eq(false)
      expect(@facility.administer_written_test(@registrant_2)).to eq(false)
      @registrant_2.earn_permit
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(@registrant_2)).to eq(true)
    end
  end

end
