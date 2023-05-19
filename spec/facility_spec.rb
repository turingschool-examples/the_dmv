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

  describe '#register vehicle' do
    it 'can give vehicles registration dates and plate type' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      facility_1.add_service('Vehicle Registration')
      
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)
      facility_1.register_vehicle(cruz)
      expect(cruz.registration_date).to eq('<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>')
      expect(cruz.plate_type).to eq(:regular)
    end

    it 'can collct payment and store records of registrations' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)

      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(facility_1.collected_fees).to eq(100)
    end
  end
end

# facility_1.register_vehicle(camaro)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]

# camaro.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# camaro.plate_type
# #=> :antique

# facility_1.register_vehicle(bolt)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

# bolt.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# bolt.plate_type
# #=> :ev

# facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

# facility_1.collected_fees
# #=> 325

# facility_2.registered_vehicles
# #=> []

# facility_2.services
# #=> []

# facility_2.register_vehicle(bolt)
# #=> nil

# facility_2.registered_vehicles
# #=> []

# facility_2.collected_fees
# #=> 0