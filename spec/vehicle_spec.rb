require 'spec_helper'

RSpec.describe Vehicle do
  describe '#initialize' do
    it 'can initialize' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      expect(cruz).to be_an_instance_of(Vehicle)
      expect(cruz.vin).to eq('123456789abcdefgh')
      expect(cruz.year).to eq(2012)
      expect(cruz.make).to eq('Chevrolet')
      expect(cruz.model).to eq('Cruz')
      expect(cruz.engine).to eq(:ice)
      expect(cruz.registration_date).to eq(nil)
    end
  end

  describe '#antique?' do
    it 'can determine if a vehicle is an antique' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      expect(cruz.antique?).to eq(false)
      expect(bolt.antique?).to eq(false)
      expect(camaro.antique?).to eq(true)
    end
  end

  describe '#electric_vehicle?' do
    it 'can determine if a vehicle is an ev' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      expect(cruz.electric_vehicle?).to eq(false)
      expect(bolt.electric_vehicle?).to eq(true)
      expect(camaro.electric_vehicle?).to eq(false)
    end
  end

  describe '#registration_date' do
    it 'can add the registration date of a vehicle' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      
      facility_1.add_service('Vehicle Registration')

      expect(cruz.registration_date).to eq(nil)
      facility_1.register_vehicle(cruz)
      expect(cruz.registration_date).not_to eq(nil)

      expect(camaro.registration_date).to eq(nil)
      facility_1.register_vehicle(camaro)
      expect(camaro.registration_date).not_to eq(nil)

      expect(bolt.registration_date).to eq(nil)
      facility_1.register_vehicle(bolt)
      expect(bolt.registration_date).not_to eq(nil)
    end
  end

  describe "#plate_type" do
    it 'can add a plate type when registering a vehicle' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      
      facility_1.add_service('Vehicle Registration')
      
      expect(cruz.plate_type).to eq(nil)
      facility_1.register_vehicle(cruz)
      expect(cruz.plate_type).to eq(:regular)

      expect(camaro.plate_type).to eq(nil)
      facility_1.register_vehicle(camaro)
      expect(camaro.plate_type).to eq(:antique)

      expect(bolt.plate_type).to eq(nil)
      facility_1.register_vehicle(bolt)
      expect(bolt.plate_type).to eq(:ev)
    end
  end
end
