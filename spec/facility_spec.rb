require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @bruce = Registrant.new('Bruce', 18, true)
    @penny = Registrant.new('Penny', 16)
    @tucker = Registrant.new('Tucker', 15)
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
  
  describe '#registered_vehicles' do
    it 'starts as an empty array' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq ([])
      expect(@facility_2.registered_vehicles).to eq ([])
    end
  end

  describe '#register_vehicle' do
    it 'can register vehicles' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq ([])

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq [@cruz]

      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq [@cruz, @bolt]
    end
  end

  describe '#collected_fees' do
    it 'start as 0' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq ([])
      expect(@facility_1.collected_fees).to eq 0
    end

    it 'collects fees when registering vehicles' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq ([])
      expect(@facility_1.collected_fees).to eq 0

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq 100
    end
  end 

  describe '#collect_fees' do
    it 'add different fees depending on the vehicle' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.registered_vehicles).to eq ([])
      expect(@facility_1.collected_fees).to eq 0

      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq 100

      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq 125

      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq 325
    end
  end

  describe '#change_plate' do
    it 'can change the vehicle plate once registered' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq :regular
    end
  end

  describe '#administer_written_test' do
    it 'can administer written test if offered that service' do
      expect(@facility_1.administer_written_test(@bruce)).to eq false
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@bruce)).to eq true
      
      expect(@facility_1.administer_written_test(@penny)).to eq false
      @penny.earn_permit
      expect(@facility_1.administer_written_test(@penny)).to eq true

      expect(@facility_1.administer_written_test(@tucker)).to eq false
      @tucker.earn_permit
      expect(@facility_1.administer_written_test(@tucker)).to eq false    
    end
  end

  describe '#administer_road_test' do
    it 'can administer road test if offered that service' do
      expect(@facility_1.administer_written_test(@bruce)).to eq false
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@bruce)).to eq true

      expect(@facility_1.administer_road_test(@tucker)).to eq false
      @tucker.earn_permit
      expect(@facility_1.administer_road_test(@tucker)).to eq false

      expect(@facility_1.administer_road_test(@bruce)).to eq false
      @facility_1.add_service('Road Test')
      expect(@facility_1.administer_road_test(@bruce)).to eq true
    end
  end

  describe '#renew_drivers_license' do
    it 'can renew license if offered that service' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@bruce)
      @facility_1.add_service('Road Test')
      @facility_1.administer_road_test(@bruce)
      expect(@facility_1.renew_drivers_license(@bruce)).to eq false

      @facility_1.add_service('Renew License')
      expect(@facility_1.renew_drivers_license(@bruce)).to eq true
    end
  end
end
