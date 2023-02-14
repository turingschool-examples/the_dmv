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
    it 'can register vehicles' do 
      @facility.add_service('Vehicle Registration')
      expect(@facility.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do
    it 'has collected fees' do
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe '#register vehicle' do
    it 'registers a vehicle' do
      expect(@facility.registered_vehicles).to eq([])
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      @facility.register_vehicle(cruz)
      expect(@facility.registered_vehicles).to eq([cruz])
    end
  

    it 'changes registration date of vehicle' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)
      expect(cruz.registration_date).to be_a(Date)
    end

    it 'assigns a plate type' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(cruz)
      expect(cruz.plate_type).to eq(:regular)
    end

    it 'costs money to register cars' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(camaro)
      expect(@facility.collected_fees).to eq(25)
    end 

    it 'cannot register a vehicle with two facilities' do
      @facility_2 = facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      @facility.add_service('Vehicle Registration')
      @facility.register_vehicle(camaro)
      @facility_2.register_vehicle(camaro)
      expect(@facility_2.registered_vehicles).to eq([])
    end
  end

  describe '#registrant' do
    it 'can administer a written test' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(registrant_1)).to eq(true)
    end

    it 'does not administer a written test to the ineligible' do
      registrant_2 = Registrant.new('Penny', 16)

      @facility.add_service('Written Test')
      expect(@facility.administer_written_test(registrant_2)).to eq(false)
    end

    it 'can administer a road test, except if ineligible' do
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      registrant_1 = Registrant.new('Bruce', 18, true)
      @facility.administer_written_test(registrant_1)
      registrant_2 = Registrant.new('Penny', 16)
      expect(@facility.administer_road_test(registrant_1)).to eq(true)
      expect(@facility.administer_road_test(registrant_2)).to eq(false)
    end

    it 'changes values in license_data hash' do
      @facility.add_service('Written Test')
      @facility.add_service('Road Test')
      registrant_1 = Registrant.new('Bruce', 18, true)
      @facility.administer_written_test(registrant_1)
      @facility.administer_road_test(registrant_1)
      expect(registrant_1.license_data).to eq({:written => true, :license => true, :renewed => false})
    end
  end
end


