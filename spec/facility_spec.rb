require 'spec_helper'
require 'pry'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end
  describe '#register_vehicle' do
    it 'can register a vehilce' do
      @facility_1.add_service('Vehicle Registration')
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      registered_vehicles = @facility_1.register_vehicle(@cruz)
      expect(registered_vehicles.first).to be_a Vehicle
      expect(@cruz.registration_date).to eq(Date.today) 
      expect(@cruz.plate_type).to eq(:regular)
      expect(@facility_1.registered_vehicles).to include(@cruz)
      expect(@facility_1.collected_fees).to eq 100 
    end
    it 'can register multiple vehicles' do
      @facility_1.add_service('Vehicle Registration')
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      registered_vehicles = @facility_1.register_vehicle(@cruz)
      registered_vehicles = @facility_1.register_vehicle(@camaro)
      registered_vehicles = @facility_1.register_vehicle(@bolt)
      expect(@cruz.registration_date).to eq(Date.today) 
      expect(@cruz.plate_type).to eq(:regular)
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to include(@cruz, @camaro, @bolt)
      expect(@facility_1.collected_fees).to eq 325
    end
  end
  describe '#administer_written_test' do
    it 'can administer the written test' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)

      facility_1.add_service('Written Test')

     expect(facility_1.administer_written_test(registrant_1)).to be true
     expect(registrant_1.license_data[:written]).to be true
    end

    it 'fails written test if no service is available' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)

      expect(facility_1.administer_written_test(registrant_1)).to be false
      expect(registrant_1.license_data[:written]).to be false
    end
  end
  describe '#administer_road_test' do
   it 'can administer the road test' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)
      
      facility_1.add_service('Written Test')

      facility_1.add_service('Road Test')
      expect(facility_1.administer_written_test(registrant_1)).to be true
      expect(registrant_1.license_data[:written]).to be true

      expect(facility_1.administer_road_test(registrant_1)).to be true
      expect(registrant_1.license_data[:license]).to be true
    end

    it 'fails road test if no service is available' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)
      expect(facility_1.administer_road_test(registrant_1)).to be false
      expect(registrant_1.license_data[:license]).to be false
    end
  end
  describe '#renew_drivers_license' do
    it 'can renew a driver\'s license' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)

      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')
      facility_1.add_service('Renew License')

      expect(facility_1.administer_written_test(registrant_1)).to be true
      expect(facility_1.administer_road_test(registrant_1)).to be true

      expect(facility_1.renew_drivers_license(registrant_1)).to be true
      expect(registrant_1.license_data[:renewed]).to be true
    end

    it 'fails to renew if no service is available' do
      facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      registrant_1 = Registrant.new('Bruce', 18, true)

      facility_1.add_service('Written Test')
      facility_1.add_service('Road Test')

      expect(facility_1.administer_written_test(registrant_1)).to be true
      expect(facility_1.administer_road_test(registrant_1)).to be true

      expect(facility_1.renew_drivers_license(registrant_1)).to be false
      expect(registrant_1.license_data[:renewed]).to be false
    end
  end
end
