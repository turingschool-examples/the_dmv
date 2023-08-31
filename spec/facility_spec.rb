require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_1.registered_vehicles).to eq([])
      expect(@facility_1.collected_fees).to eq(0)
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
    it 'sets the registration date for the vehicle' do
      expect(@cruz.registration_date).to be nil

      @facility_1.register_vehicle(@cruz)

      expect(@cruz.registration_date).to be_an_instance_of(Date)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'assigns plate type :regular to non-ev cars that are less than 25yrs old' do
      expect(@cruz.plate_type).to be nil
      
      @facility_1.register_vehicle(@cruz)

      expect(@cruz.plate_type).to be :regular
    end

    it 'assigns plate type :antique to non-ev vehicles older than 25yrs old' do
      expect(@camaro.plate_type).to be nil

      @facility_1.register_vehicle(@camaro)

      expect(@camaro.plate_type).to be :antique
    end

    it 'assigns plate type :ev to ev vehicles' do
      expect(@bolt.plate_type).to be nil

      @facility_1.register_vehicle(@bolt)

      expect(@bolt.plate_type).to be :ev
    end

    it 'adds registered vehicle to facility registered_vehicles' do
      expect(@facility_1.registered_vehicles).to eq([])

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'collects $100 in fees for registration with :regular plates' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@cruz)

      expect(@facility_1.collected_fees).to eq(100)
    end

    it 'collects $25 in fees for registration with :antique plates' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@camaro)

      expect(@facility_1.collected_fees).to eq(25)
    end

    it 'collects $200 in fees for registration with :ev plates' do
      expect(@facility_1.collected_fees).to eq(0)

      @facility_1.register_vehicle(@bolt)

      expect(@facility_1.collected_fees).to eq(200)
    end
  end
end
