require './lib/vehicle'
require './lib/facility'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'Albany DMV Office', 
    address: '2242 Santiam Hwy SE Albany OR 97321', 
    phone: '541-967-2014'})
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

  describe 'add service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe "facility methods" do
    it "Has registration attributes" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      expect(facility_1.services).to eq([])
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.services).to include('Vehicle Registration')
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)
    end

    it "Can register vehicles" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.new)
      expect(cruz.plate_type).to eq(:regular)
    end

    it "Can collect fees and register multiple vehicles" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      expect(facility_1.collected_fees).to eq(100)
      facility_1.register_vehicle(camaro)
      expect(camaro.registration_date).to eq(Date.new)
      #check if the correct plate is being applied
      expect(camaro.plate_type).to eq(:antique)
      facility_1.register_vehicle(bolt)
      expect(bolt.registration_date).to eq(Date.new)
      expect(bolt.plate_type).to eq(:ev)
      expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(facility_1.collected_fees).to eq(325)
    end

    it "Allows only one facility to register a car" do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      facility_1.add_service('Vehicle Registration')
      facility_2.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      facility_1.register_vehicle(bolt)
      #both facilities can register, but facility 2 should not be able to re-register cars.
      expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq(['Vehicle Registration'])
      expect(facility_2.register_vehicle(bolt)).to eq(nil)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end
end
