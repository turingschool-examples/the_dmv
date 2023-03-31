require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    @facility_1.add_service('Vehicle Registration')
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

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      expect(@facility.add_service('Vehicle Registration')).to eq ('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#registered_vehicles' do 
    it 'returns an empty array by default' do 
      expect(@facility_1.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do 
    it 'returns an integer of total collected fees, default 0' do 
      expect(@facility_1.collected_fees).to eq(0)
    end
  end

  describe '#register_vehicle' do 
    xit 'adds vehicle to registered vehicles and updates collected fees' do 
      expect(@cruz.registration_date).to eq(nil)

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
    end

    xit 'changes vehicle plate type and updates reg date' do 
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to eq(Date.today)
      expect(@cruz.plate_type).to eq(:regular)
    end

    xit 'cannot register vehicle once registered elsewhere' do 
      @facility_1.register_vehicle(@cruz)

      expect(@facility_2.register_vehicle).to be nil
      
      @facility_2.register_vehicle

      expect(@facility_2.registered_vehicles).to eq([])
      
    end

    xit 'cannot register a vehicle until the service is added' do
      expect(@facility_2.services).to eq([])

      @facility_2.add_service('Vehicle Registration')


    end
  end
end
