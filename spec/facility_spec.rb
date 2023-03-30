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

  describe 'Iteration 2' do
    it 'it creates list of registered vehicles, checks collected_fees is zero' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      expect(facility_1.add_service('Vehicle Registration')).to eq(["Vehicle Registration"])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)
    end

    it 'registers vehicle, adds to list, creates a registration_date' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})

      facility_1.register_vehicle(cruz)

      expect(facility_1.registered_vehicles).to eq([cruz])
    end
  end
end






# pry(main)> facility_1.register_vehicle(cruz)
# #=> [#<Vehicle:0x0000000135a48b08...>]

# pry(main)> cruz.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# pry(main)> cruz.plate_type
# #=> :regular

# pry(main)> facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>]

# pry(main)> facility_1.collected_fees
# #=> 100

# pry(main)> facility_1.register_vehicle(camaro)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>]

# pry(main)> camaro.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# pry(main)> camaro.plate_type
# #=> :antique

# pry(main)> facility_1.register_vehicle(bolt)
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

# pry(main)> bolt.registration_date
# #=> #<Date: 2023-01-12 ((2459957j,0s,0n),+0s,2299161j)>

# pry(main)> bolt.plate_type
# #=> :ev

# pry(main)> facility_1.registered_vehicles
# #=> [#<Vehicle:0x0000000135a48b08...>, #<Vehicle:0x0000000135adb610...>, #<Vehicle:0x0000000125832180...>]

# pry(main)> facility_1.collected_fees
# #=> 325

# pry(main)> facility_2.registered_vehicles
# #=> []

# pry(main)> facility_2.services
# #=> []

# pry(main)> facility_2.register_vehicle(bolt)
# #=> nil

# pry(main)> facility_2.registered_vehicles
# #=> []

# pry(main)> facility_2.collected_fees
# #=> 0
