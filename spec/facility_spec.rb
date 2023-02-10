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
      expect(@facility.registered_vehicles).to eq([])
      expect(@facility.collected_fees).to eq(0)
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

  describe '#register_vehicle' do
    it 'can register a vehicle' do
      camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})

      expect(cruz.registration_date).to eq(nil)
      @facility.register_vehicle(cruz)
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
      expect(@facility.collected_fees).to eq(100)
      
      expect(bolt.registration_date).to eq(nil)
      expect(bolt.plate_type).to eq(nil)
      expect(@facility.collected_fees).to eq(100)
      @facility.register_vehicle(bolt)
      expect(bolt.registration_date).to eq(Date.today)
      expect(bolt.plate_type).to eq(:ev)
      expect(@facility.collected_fees).to eq(300) # 100(:regular) + 200(:ev)

      expect(camaro.plate_type).to eq(nil)
      expect(camaro.registration_date).to eq(nil)
      expect(@facility.collected_fees).to eq(300)
      @facility.register_vehicle(camaro)
      expect(camaro.plate_type).to eq(:antique)
      expect(camaro.registration_date).to eq(Date.today)
      expect(@facility.collected_fees).to eq(325) # 25(:antique)
    end
  end

end
