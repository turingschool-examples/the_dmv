require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end

    it 'can initialize another facility' do
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
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

  describe '#register vehicle' do
    it 'can register an antique vehicle, collect fees, and assign a license plate' do
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq (25)  
      expect(@camaro.plate_type).to be (:antique)
    end

    it 'can register a regular vehicle, collect fees, and assign a license plate' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq (100)
      expect(@cruz.plate_type).to be (:regular)  
    end

    it 'can register an electric vehicle, collect fees, and assign a license plate' do
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq (200)  
      expect(@bolt.plate_type).to be (:ev)
    end
  end

  describe 'collected fees' do
    it 'can collect fees on multiple vehicle registrations' do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq (0)
      
      @facility_1.add_service('Vehicle Registration')
      
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq (325)
    end
  end

  describe 'administer written test' do
    it 'can administer a written test' do
      @registrant_1 = Registrant.new('Bruce', 18, true)

      @facility_1.add_service('Written test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to be true

    end

    it 'can deny a written test' do
      @registrant_2 = Registrant.new('Penny', 15)

      @facility_1.add_service('Written test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to be false

    end
  end

  describe 'administer road test' do
    it 'can administer a road test' do
      @registrant_1 = Registrant.new('Bruce', 18, true)

      @facility_1.add_service('Written test')
      @facility_1.add_service('Road test')
      @facility_1.administer_written_test(@registrant_1)
      @facility_1.administer_road_test(@registrant_1)

      expect(@registrant_1.license_data[:written]).to be true

    end

    it 'can deny a road test' do
      @registrant_2 = Registrant.new('Penny', 15)

      @facility_1.add_service('Written test')
      @facility_1.add_service('Road test')
      @facility_1.administer_written_test(@registrant_2)
      @facility_1.administer_road_test(@registrant_2)

      expect(@registrant_2.license_data[:written]).to be false

    end
  end
end
