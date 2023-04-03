require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end
  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
      expect(@facility_1.phone).to eq('541-967-2014')
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

  describe 'facility_1' do
    before(:each) do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    it 'adds vehicle registration as a service to the facility' do
      expect(@facility_1.add_service('Vehicle Registration')).to eq(['Vehicle Registration'])
    end

    before(:each) do
      @facility_1.add_service('Vehicle Registration')
    end

    it 'checks the registration date on the vehicle' do 
      expect(@cruz.registration_date).to eq(nil)
    end

    it 'makes a list of registered vehicles' do 
      expect(@facility_1.registered_vehicles).to eq([])
    end

    it '#collected_fees' do
      expect(@facility_1.collected_fees).to eq(0)
    end

    it '#register_vehicle(vehicle)' do 
      expect(@facility_1.register_vehicle(@cruz)).to eq([@cruz])
    end

    it 'documents the date of registration' do
      expect(@cruz.registration_date).to eq(nil)
      @facility_1.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end

    it 'assigns a plate type' do
      expect(@cruz.plate_type).to eq(:regular)
    end

    it 'adds to the list of registered vehicles' do
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.registered_vehicles).to eq([@cruz])
    end

    it 'adds to the total collected fees' do 
      @facility_1.register_vehicle(@cruz)
      expect(@facility_1.collected_fees).to eq(100)
      expect(@facility_1.register_vehicle(@camaro)).to eq([@cruz, @camaro])
      expect(@camaro.registration_date).to eq(Date.today)
      expect(@camaro.plate_type).to eq(:antique)
      expect(@facility_1.register_vehicle(@bolt)).to eq([@cruz, @camaro,@bolt])
      expect(@bolt.registration_date).to eq(Date.today)
      expect(@bolt.plate_type).to eq(:ev)
      expect(@facility_1.registered_vehicles).to eq([@cruz, @camaro,@bolt])
      expect(@facility_1.collected_fees).to eq(325)
    end
  end

  describe 'facility_2' do
    before(:each) do
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end
  end

    # it 'checks for registered vehicles' do
    #   expect(@facility_2.registered_vehicles).to eq([])
    # end

    # it 'checks for services' do
    #   expect(@facility_2.services).to eq([])
    # end

end
