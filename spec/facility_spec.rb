require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice})
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility).to be_an_instance_of(Facility)
      expect(@facility.name).to eq('DMV Tremont Branch')
      expect(@facility.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility.phone).to eq('(720) 865-4600')
      expect(@facility.services).to eq([])
    end
    it 'creates a facility' do
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
    end
    it 'creates vehicles' do
      expect(@cruz.vin).to eq('123456789abcdefgh')
      expect(@cruz.year).to eq(2012)
      expect(@cruz.make).to eq('Chevrolet')
      expect(@cruz.model).to eq('Cruz')
      expect(@cruz.engine).to eq(:ice)
      expect(@cruz.registration_date).to be_nil
      expect(@cruz.plate_type).to be_nil
    end
  end

  describe '#add service' do
    it 'can add the available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
    it 'adds a another service to the facility' do
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to include('Vehicle Registration')
    end
  end

  describe '#register_vehicle' do
    context 'when service is available' do
      before(:each) do
        @facility_1.add_service('Vehicle Registration')
      end

      it 'registers the vehicle and updates it' do
        @facility_1.register_vehicle(@cruz)
        expect(@cruz.registration_date).not_to be_nil
        expect(@cruz.plate_type).to eq(:regular)
        expect(@facility_1.registered_vehicles).to include(@cruz)
        expect(@facility_1.collected_fees).to eq(100)
      end

      it 'assigns plate type for antique cars' do
        @facility_1.register_vehicle(@camaro)
        expect(@camaro.registration_date).not_to be_nil
        expect(@camaro.plate_type).to eq(:antique)
        expect(@facility_1.registered_vehicles).to include(@camaro)
        expect(@facility_1.collected_fees).to eq(200)
      end

      it 'assigns plate type for electric vehicles' do
        @facility_1.register_vehicle(@bolt)
        expect(@bolt.registration_date).not_to be_nil
        expect(@bolt.plate_type).to eq(:ev)
        expect(@facility_1.registered_vehicles).to include(@bolt)
        expect(@facility_1.collected_fees).to eq(325)
      end
    end

    context 'when the service is not available' do
      it 'does not register the vehicle' do
        expect(@facility_2.register_vehicle(@bolt)).to be_nil
        expect(@facility_2.registered_vehicles).to be_empty
        expect(@facility_2.collected_fees).to eq(0)
      end
    end
  end

end


