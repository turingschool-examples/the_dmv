require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15)
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility_1.phone).to eq('541-967-2014')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq 0
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

  describe '#register_vehicle' do
    it 'adds vehicle to registered vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
      expect(@cruz.registration_date).to eq('2/9/2023')
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.collected_fees).to eq 100

      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq('2/9/2023')
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.collected_fees).to eq 125

      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro, @bolt])
      expect(@bolt.registration_date).to eq('2/9/2023')
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.collected_fees).to eq 325
    end

    it 'only registers vehicle if service provided at facility' do
      expect(@facility_1.register_vehicle(@cruz)).to eq('Service not available at this location.')

      expect(@facility_1.registered_vehicles).to eq([])
      expect(@bolt.registration_date).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      expect(@facility_1.collected_fees).to eq 0

    end

  end

  describe '#administer_written_test' do
    it 'changes written value on registrant license_data' do
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_1)).to be true
      expect(@registrant_1.license_data).to eq({:written=>true, :license=>false, :renewed=>false})
    end

    it 'only administers written test if service provided at facility' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq('Service not available at this location.')
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'only administers written test if registrant has a permit' do
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_2)).to eq('You are not eligible for a written test.')
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

    end

    it 'only administers written test if registrant at least 16' do
      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_3)).to eq('You are not eligible for a written test.')
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
    # checks that capitalization won't matter?
  end
end
