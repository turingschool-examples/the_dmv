require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
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

  describe '#register_vehicle' do
    before(:each) do
      @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
      @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
      @facility_1.add_service('Vehicle Registration')
    end
    it 'can register vehicles if service is offered' do
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles.count).to eq(1)
      expect(@facility_1.registered_vehicles[0]).to be_an_instance_of(Vehicle)
      @facility_1.register_vehicle(@camaro)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.registered_vehicles.count).to eq(3)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      @facility_2.register_vehicle(bolt)
      expect(@facility_2.registered_vehicles).to eq([])
      expect(@facility_2.services).to eq([])
      expect(@facility_2.collected_fees).to eq(0)

    end

    it 'can collect fees' do
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.register_vehicle(@camaro)
      expect(@facility_1.collected_fees).to eq(125)
      @facility_1.register_vehicle(@bolt)
      expect(@facility_1.collected_fees).to eq(325)
    end

    it 'can assign plate types' do
      expect(@cruz.plate_type).to eq(nil)
      expect(@camaro.plate_type).to eq(nil)
      expect(@bolt.plate_type).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.plate_type).to eq(:regular)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.plate_type).to eq(:antique)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.plate_type).to eq(:ev)
    end

    it 'can assign registration date' do
      expect(@cruz.registration_date).to eq(nil)
      expect(@camaro.registration_date).to eq(nil)
      expect(@bolt.registration_date).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to be_an_instance_of(Date)
      @facility_1.register_vehicle(@camaro)
      expect(@camaro.registration_date).to be_an_instance_of(Date)
      @facility_1.register_vehicle(@bolt)
      expect(@bolt.registration_date).to be_an_instance_of(Date)
    end
  end
end
