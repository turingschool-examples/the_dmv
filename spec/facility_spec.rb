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
      @facility_1.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
      expect(@facility_1.services).to eq(['Vehicle Registration'])
    end
  end

  describe '#vehicle registration' do
    it 'facilities start with no registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq[]
    end
    it 'facilities gain registered vehicles upon vehicle registration' do
      facility_1.register_vehicle(cruz)
      expect(facility_1.registered_vehicles).to be_an_instance_of([Vehicle])
  end

  describe '#collected fees' do
    it 'facilities start with no collected fees and charge appropriately' do
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(camaro)
      expect(@facility_1.collected_fees).to eq(125)
      @facility_1.register_vehicle(bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end

    describe '#registration date' do
      it 'vehicles start with no registration date' do
        expect(@cruz.registration_date).to eq(nil)
      end
      it 'vehicles get registration date once registered' do 
        @facility_1.register_vehicle(cruz)
        expect(cruz.registration_date).to be_an_instance_of(Date.today.month)
        @facility_1.register_vehicle(camaro)
        expect(camaro.registration_date).to be_an_instance_of(Date.today.month)
        @facility_1.register_vehicle(bolt)
        expect(bolt.registration_date).to be_an_instance_of(Date.today.month)
      end
    end

    describe '#plate_type' do
    it 'vehicles start with no plate type' do
      expect(cruz.plate_type).to eq(nil)
    end
    it 'vehicles are assigned plate type upon registration' do
      cruz.plate_type
      expext(cruz.plate_type).to eq(:regular)
    end
end
