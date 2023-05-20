require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({ name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({ name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({ name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({ vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice })
    @bolt = Vehicle.new({ vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev })
    @camaro = Vehicle.new({ vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice })
  end

  # Starts 'Vehicle Registration' section of Iteration 2

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

  describe '#add additional facilities' do
    it 'returns empty array for registered_vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_2.registered_vehicles).to eq([])
    end

    it 'adds a service to facility_1' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to include('Vehicle Registration')
    end
  end

  describe '#registering vehicles' do
    it 'all elements return correct initial values' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
    end
    it 'register_vehicle registers the vehicle for cruz' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'register_vehicle registers the vehicle for camaro' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.registration_date).to eq(Date.today)
    end

    it 'register_vehicle registers the vehicle for bolt' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.registration_date).to eq(Date.today)
    end
  end

  describe '#plate_type' do
    it 'plate_type method returns correct plate for regular' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'plate_type method returns correct plate for antique' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.registered_vehicles).to eq([@camaro])
    end

    it 'plate_type method returns correct plate for ev' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@bolt])
    end
  end

  describe '#collected_fees' do
    it 'collected_fees returns correct value for regular' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'collected_fees returns correct value for antique' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collected_fees returns correct value for ev' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end
  end

  describe 'registered_vehicles final' do
    it 'facility will have all three vehicles registered.' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
    end
  end

  describe 'collected_fees final' do
    it 'facility will have collected fees for all vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe 'facility.services' do
    it 'facilities without "Vehicle Registration" service cannot register vehicles' do
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.register_vehicle(@bolt)).to eq(nil)
    end
  end

  # Start 'Getting a Driver's License' section of Iteration 2
  #  Administer a written test
  # A written test can only be administered to registrants with a permit and
  # who are at least 16 years of age

  describe 'new registrants' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker', 15)
    end
    it 'registrants license data is correct' do
      expect(@registrant_1.license_data).to eq({ written: false, license: false, renewed: false })
      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
      expect(@registrant_3.license_data).to eq({ written: false, license: false, renewed: false })
    end
    it 'registrants permit data is correct (tests permit? method)' do
      expect(@registrant_1.permit?).to eq(true)
    end
  end

  describe 'administer_written_test' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker', 15)
    end
    it 'administer_written_test updates license_data' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: false, renewed: false })
    end
    it 'administer_written_test on facility updates license_data' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)

      expect(@registrant_1.license_data).to eq({ written: true, license: false, renewed: false })
      expect(@registrant_2.age).to eq(16)
      expect(@registrant_2.permit?).to eq(false)
    end
    it 'tests administer_written_test on registrant without permit' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'earn_permit and administer_written_test' do
      @facility_1.add_service('Written Test')
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to eq(true)
      expect(@registrant_2.license_data).to eq({ written: false, license: false, renewed: false })

      @facility_1.administer_written_test(@registrant_2)

      expect(@registrant_2.license_data).to eq({ written: true, license: false, renewed: false })
    end

    it 'administer_written_test checks age' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_3)

      expect(@registrant_3.age).to eq(15)
      expect(@registrant_3.permit?).to eq(false)
      expect(@registrant_3.license_data).to eq({ written: false, license: false, renewed: false })
    end

    it 'administer_written_test checks age and permit' do
      @facility_1.add_service('Written Test')
      @registrant_3.earn_permit
      @facility_1.administer_written_test(@registrant_3)

      expect(@registrant_3.permit?).to eq(true)
      expect(@registrant_3.license_data).to eq({ written: false, license: false, renewed: false })
    end
  end
end
