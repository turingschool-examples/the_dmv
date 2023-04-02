require './lib/facility'
require './lib/vehicle'
require 'date'

RSpec.describe Facility do
  describe '#Registering a vehicle' do
    it 'facility 1 can register a vehicle' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)
    end

    it 'registers cruz car' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)

      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(facility_1.collected_fees).to eq(100)
    end

    it 'registers camaro car' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)

      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(facility_1.collected_fees).to eq(100)

      expect(facility_1.register_vehicle(camaro)).to eq([cruz, camaro])
      expect(camaro.registration_date).to eq(Date.today)
      expect(camaro.plate_type).to eq(:antique)
      expect(facility_1.registered_vehicles).to eq([cruz, camaro])
      expect(facility_1.collected_fees).to eq(125)
    end

    it 'registers bolt car' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)

      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(facility_1.collected_fees).to eq(100)

      expect(facility_1.register_vehicle(camaro)).to eq([cruz, camaro])
      expect(camaro.registration_date).to eq(Date.today)
      expect(camaro.plate_type).to eq(:antique)
      expect(facility_1.registered_vehicles).to eq([cruz, camaro])
      expect(facility_1.collected_fees).to eq(125)

      expect(facility_1.register_vehicle(bolt)).to eq([cruz, camaro, bolt])
      expect(bolt.registration_date).to eq(Date.today)
      expect(bolt.plate_type).to eq(:ev)
      expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(facility_1.collected_fees).to eq(325)
    end

    it 'checks facility 2 details' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )

      expect(facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
      expect(cruz.registration_date).to eq(nil)
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)

      expect(facility_1.register_vehicle(cruz)).to eq([cruz])
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(facility_1.collected_fees).to eq(100)

      expect(facility_1.register_vehicle(camaro)).to eq([cruz, camaro])
      expect(camaro.registration_date).to eq(Date.today)
      expect(camaro.plate_type).to eq(:antique)
      expect(facility_1.registered_vehicles).to eq([cruz, camaro])
      expect(facility_1.collected_fees).to eq(125)

      expect(facility_1.register_vehicle(bolt)).to eq([cruz, camaro, bolt])
      expect(bolt.registration_date).to eq(Date.today)
      expect(bolt.plate_type).to eq(:ev)
      expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(facility_1.collected_fees).to eq(325)

      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])
      expect(facility_2.register_vehicle(bolt)).to eq(nil)
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end
    
end