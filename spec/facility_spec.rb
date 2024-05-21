require 'spec_helper'
require 'date'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @registrant_1 = Registrant.new('Bruce', 16, true)
    @registrant_2 = Registrant.new('Penny', 15)
    @registrant_3 = Registrant.new('Tucker', 15 )

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

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#registered_vehicles' do
    it 'can register a vehicle' do
      expect(@facility_1.registered_vehicles).to eq([])
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to include(@cruz)
    end

    it 'records registration date' do
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'can collect fees' do
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(200)
    end

    it 'can determine plate type' do
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
    end
  end

  describe '#administer_written_test' do
    it 'verifies if registrant is eligible' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end

    it 'verifies registrant is not eligible' do
      expect(@facility_1.administer_written_test(@registrant_2)).to eq(false)
    end
  end

  describe '#administer_road_test' do
    it 'verfies registrant is eligible and administers road test' do
      @registrant_3.license_data[:written] = true
      expect(@facility_1.administer_road_test(@registrant_3)).to eq(true)
      expect(@registrant_3.license_data[:license]).to eq(true)
    end
  end

  describe '#renew_license' do
    it  'verifies if registrant is elegible to renew' do
      @registrant_3.license_data[:license] = true
      expect(@facility_1.renew_license(@registrant_3)).to eq(true)
    end
  end
end




  

