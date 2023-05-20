require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('Albany DMV Office')
      expect(@facility.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility.phone).to eq('541-967-2014')
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

    it '#has to have the service in order to do the function' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(registrant_1.permit?).to eq(true)
      expect(@facility_1.administer_written_test(registrant_1)).to eq(false)
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(registrant_1)
      expect(@facility_1.administer_road_test(registrant_1)).to eq(false)
    end
  end
  describe '#register vehicle' do
    it 'can register a vehicle' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@cruz.plate_type).to eq(:regular)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@cruz.registration_date).to eq(Date.today)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@facility_1.collected_fees).to eq(325)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @bolt, @camaro])
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
    end
  end
  describe '#administer_written_test' do
    it 'can give written tests' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility_1.add_service('Written Test')
      expect(@facility_1.services).to eq(["Written Test"])
      expect(@facility_1.administer_written_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end
    it 'can check attributes required for test taking' do
        registrant_2 = Registrant.new('Penny', 16 )
        registrant_3 = Registrant.new('Tucker', 15 )
        @facility_1.add_service('Written Test')
        expect(@facility_1.administer_written_test(registrant_2)).to eq(false)
        expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
        registrant_2.earn_permit
        expect(@facility_1.administer_written_test(registrant_2)).to eq(true)
        registrant_3.earn_permit
        expect(@facility_1.administer_written_test(registrant_3)).to eq(false)
    end
  end
  describe '#administer_road_test' do
    it 'can give road tests' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.administer_written_test(registrant_1)
      @facility_1.administer_road_test(registrant_1)
      expect(@facility_1.services).to eq(["Written Test", "Road Test"])
      expect(@facility_1.administer_road_test(registrant_1)).to eq(true)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>false})
    end
    it 'can check attributes required to take road test' do
      registrant_3 = Registrant.new('Tucker', 15 )
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      expect(registrant_3.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
  describe 'renew_drivers_license' do
    it 'can add Renew License to license' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility_1.add_service('Written Test')
      @facility_1.add_service('Road Test')
      @facility_1.add_service('Renew License')
      @facility_1.administer_written_test(registrant_1)
      @facility_1.administer_road_test(registrant_1)
      @facility_1.renew_drivers_license(registrant_1)
      expect(registrant_1.license_data).to eq({:written=>true, :license=>true, :renewed=>true})
    end
  end
end
