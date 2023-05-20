require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
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

  describe '#register_vehicle' do
    it 'has an empty registered vehicle array' do
      expect(@facility_1.registered_vehicles).to eq []
    end

    it 'has a collected_fees variable containing 0' do
      expect(@facility_1.collected_fees).to eq 0
    end

    it 'returns a prompt if someone attempts to register their vehicle and service isnt offered' do
      expect(@facility_1.register_vehicle(@cruz)).to eq "Facility does not currently offer this service."
    end

    it 'can collect fees' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq 100
    end

    it 'can add vehicle to list of registered vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq [@cruz]
    end

    it 'can set vehicle registration date' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq Date.today.year
    end

    it 'can set vehicle plate type' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq :regular
    end

    it 'can properly register multiple vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@bolt)
      @facility_1.register_vehicle(@camaro)
      expect(@bolt.plate_type).to eq :ev
      expect(@bolt.registration_date).to eq Date.today.year
      expect(@camaro.plate_type).to eq :antique
      expect(@camaro.registration_date).to eq Date.today.year
      expect(@facility_1.registered_vehicles).to eq [@cruz, @bolt, @camaro]
      expect(@facility_1.collected_fees).to eq 325
      expect(@facility_2.services).to eq []
      expect(@facility_2.register_vehicle(@bolt)).to eq "Facility does not currently offer this service."
      expect(@facility_2.registered_vehicles).to eq []
      expect(@facility_2.collected_fees).to eq 0
    end
  end

  describe '#administer_written_test' do
    it 'checks if facility offers this service' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq "Facility does not currently offer this service."
    end
  
    it 'checks if registrant has permit' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_2)).to eq "Registrant has not yet earned permit."
    end

    it 'checks if registrant is at least 16 years of age' do
      @facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_3)).to eq "Sorry, the registrant is not old enough to take the written test."
    end

    it 'updates registrants license data if eligible for written test' do
      @facility_1.add_service('Written Test')
      expect(@registrant_1.license_data[:written]).to eq false
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data[:written]).to eq true
    end

    it 'can allow registrant to earn permit then take written test' do
      @facility_1.add_service('Written Test')
      expect(@registrant_2.license_data[:written]).to eq false
      @registrant_2.earn_permit
      @facility_1.administer_written_test(@registrant_2)
      expect(@registrant_2.license_data[:written]).to eq true
    end

    it 'will not allow underage registrant to earn permit then take written test' do
      @facility_1.add_service('Written Test')
      expect(@registrant_3.license_data[:written]).to eq false
      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)
      expect(@registrant_3.license_data[:written]).to eq false
    end
  end
end
