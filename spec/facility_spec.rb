require 'spec_helper'

RSpec.describe Facility do
  let(:facility_1) { Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' }) }
  let(:facility_2) { Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' }) }
  let(:facility_3) { Facility.new({name: 'Bend DMV Office', address: '63030 O B Riley Rd Bend OR 97701', phone: '541-388-6322' }) }

  let(:cruz) { Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} ) }
  let(:bolt) { Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} ) }
  let(:camaro) { Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} ) }

  let(:registrant_1) { Registrant.new('Bruce', 18, true ) }
  let(:registrant_2) { Registrant.new('Penny', 15 ) }
  let(:registrant_3) { Registrant.new('Tucker', 15 ) }

  describe '#initialize' do
    it 'can initialize' do
      expect(facility_1).to be_an_instance_of(Facility)
      expect(facility_1.name).to eq('Albany DMV Office')
      expect(facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(facility_1.phone).to eq('541-967-2014')
      expect(facility_1.services).to eq([])
      expect(facility_1.registered_vehicles).to eq([])
      expect(facility_1.collected_fees).to eq(0)

    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(facility_1.services).to eq([])
      facility_1.add_service('New Drivers License')
      facility_1.add_service('Renew Drivers License')
      facility_1.add_service('Vehicle Registration')
      expect(facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    it 'does this when registered vehicle is not 25 years old' do
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)

      expect(facility_1.registered_vehicles).to eq([cruz])
      expect(cruz.registration_date).to be_a(Date)
      expect(facility_1.collected_fees).to eq(100)
      expect(cruz.plate_type).to eq(:regular)
    end

    it 'does this when registered vehicle is 25 years old' do
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(camaro)

      expect(facility_1.registered_vehicles).to eq([camaro])
      expect(camaro.registration_date).to be_a(Date)
      expect(facility_1.collected_fees).to eq(25)
      expect(camaro.plate_type).to eq(:antique)
    end

    it 'does this when registered vehicle is an electric car' do
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(bolt)

      expect(facility_1.registered_vehicles).to eq([bolt])
      expect(bolt.registration_date).to be_a(Date)
      expect(facility_1.collected_fees).to eq(200)
      expect(bolt.plate_type).to eq(:ev)
    end

    it 'does this when you register multiple vehicles' do
      facility_1.add_service('Vehicle Registration')
      facility_1.register_vehicle(cruz)
      facility_1.register_vehicle(camaro)
      facility_1.register_vehicle(bolt)

      expect(facility_1.registered_vehicles).to eq([cruz, camaro, bolt])
      expect(facility_1.collected_fees).to eq(325)
    end

    it 'does this if the facility does not have the vehicle registration service' do
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])

      facility_2.register_vehicle(bolt)

      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end
  end

  describe '#administer_written_test' do
    it 'cannot administer a written test if the facility does not have it as a service' do
      expect(facility_1.administer_written_test(registrant_1)).to be(false)
    end

    it 'changes written_test in registrant license_data to true if the facility offeres the service' do
      facility_1.add_service('Written test')
      require 'pry'; binding.pry
      facility_1.administer_written_test(registrant_1)
require 'pry'; binding.pry
      expect(registrant_1.license_data[:written]).to be(true)
    end
  end
end
