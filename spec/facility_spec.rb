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

    it 'add service to facility_1' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      expect(facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
    end

    it 'registration_date is nil by default' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      expect(cruz.registration_date).to eq(nil)
    end

    it 'registed vehicles is empty array' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      expect(facility_1.registered_vehicle).to eq([])
    end

    it 'collected fees starts with zero' do
      facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      expect(facility_1.collected_fees).to eq(0)
    end

    it 'register vehicles' do
      facility_2 = Facility.new({name: 'Another Facility', address: '456 Oak Ave', phone: '555-555-5555'})
      bolt = Vehicle.new({vin: '987654321xyz', year: 2020, make: 'Chevrolet', model: 'Bolt', engine: :electric})      expect(facility_1.register_vehicle(cruz)).to eq([<Vehicle:0x0000000135a48b08...>])
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.services).to eq([])
      expect(facility_2.register_vehicle(bolt)).to be_nil
      expect(facility_2.registered_vehicles).to eq([])
      expect(facility_2.collected_fees).to eq(0)
    end

end


# facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
#       facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
#       cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
#       bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
#       camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      
#       facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
#       facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
#       cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
#       bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
#       camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
