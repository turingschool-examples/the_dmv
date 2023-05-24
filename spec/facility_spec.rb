require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
      expect(@facility.services).to eq([])
      expect(@facility.registered_vehicles).to eq([])
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

  describe '#register_vehicle' do
    it 'can register vehicles' do
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility.register_vehicle(bolt)
      @facility.register_vehicle(camaro)
      expect(@facility.registered_vehicles).to eq([bolt, camaro])
      expect(@facility.collected_fees).to eq(225)
      expect(bolt.plate_type).to eq(:ev)
      expect(bolt.registration_date).to eq(Time.new)
    end
    end
    
    describe '#testing' do
      it 'administer written test' do
        @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew Licence')
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )
        registrant_2.earn_permit
        expect(@facility.administer_written_test(registrant_1)).to eq(true)
        expect(@facility.administer_written_test(registrant_2)).to eq(false)
       
      end
      end
      it 'administer road test' do
        @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew Licence')
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 16 )
        @facility.administer_written_test(registrant_1)
        expect(@facility.administer_road_test(registrant_1)).to eq(true)
        expect(@facility.administer_road_test(registrant_2)).to eq(false)
      end
    
        it 'renew licence' do
          @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      @facility.add_service('Renew Licence')
          registrant_1 = Registrant.new('Bruce', 18, true )
          registrant_2 = Registrant.new('Penny', 16 )
          @facility.administer_written_test(registrant_1)
          @facility.administer_road_test(registrant_1)
          expect(@facility.renew_drivers_licence(registrant_1)).to eq(true)
          expect(@facility.renew_drivers_licence(registrant_2)).to eq(false)
        end
    
end
