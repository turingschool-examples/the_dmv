require 'spec_helper'
require 'date'
require './lib/registrant'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new("Bruce", 18, true )
    @registrant_2 = Registrant.new("Penny", 15 )
    @registrant_3 = Registrant.new("Tucker", 16)
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

  describe '#register_vehicle(cruz)' do
    it 'registers a vehicle' do

      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@cruz)).to eq(@facility_1.registered_vehicles)
    end
  end

  describe '#register_vehicle(bolt)' do
    it 'registers (bolt)' do

      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@bolt)).to eq(@facility_1.registered_vehicles)
    end
  end

  describe '#register_vehicle(camaro)' do

    it 'registers (camaro)' do
      @facility_1.add_service('Vehicle Registration')

      expect(@facility_1.register_vehicle(@camaro)).to eq(@facility_1.registered_vehicles)
    end
  end

  describe '#set_plate_type' do
    it 'returns the plate type' do
      @facility_1.registered_vehicles

      expect(@facility_1.set_plate_type(@cruz)).to eq(:regular)
      expect(@facility_1.set_plate_type(@bolt)).to eq(:ev)
      expect(@facility_1.set_plate_type(@camaro)).to eq(:antique)
    end
  end

  describe '#administer_written_test' do
    it 'returns if AWT is true' do
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end


    it 'returns if AWT is true' do
      @facility_1.add_service('Written Test')

        expect(@facility_1.administer_written_test(@registrant_3)).to eq(false)
        expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
    end
  end

    describe '#administer_road_help' do
    it 'returns license ture' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@facility_1.administer_road_test(@registrant_1)).to eq(true)
    end

    it 'returns license true r3' do
      @registrant_3.earn_permit
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_3)

      expect(@facility_1.administer_road_test(@registrant_3)).to eq(true)
    end

    it 'returns license false r2' do
      @registrant_2.earn_permit
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@facility_1.administer_road_test(@registrant_2)).to eq(false)
    end
  end

  describe '#renew_drivers_license' do
    it 'returns if registrant can renew drivers license' do
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@facility_1.renew_drivers_license(@registrant_1)).to eq(true)
    end

    it 'returns if registrant can renew drivers license' do
      @registrant_3.earn_permit
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      @facility_1.administer_written_test(@registrant_3)
      @facility_1.administer_road_test(@registrant_3)

      expect(@facility_1.renew_drivers_license(@registrant_3)).to eq(true)
    end

    it 'returns if registrant can renew drivers license' do
      @registrant_2.earn_permit
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)

      expect(@facility_1.renew_drivers_license(@registrant_2)).to eq(false)
    end
  end
end
