require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
    @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
    @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
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

  describe 'register vehicle' do
    it 'registers a vehicle' do
      @facility.register_vehicle(@cruz)
      expect(@facility.registered_vehicles).to include(@cruz)
    end
  end

  describe 'registration date' do
    it 'sets the registration date to today' do
      @facility.register_vehicle(@cruz)
      expect(@cruz.registration_date).to eq(Date.today)
    end
  end

  # describe 'plate type' do
  #   it 'will determine plate type' do
  #     expect(@cruz.plate_type).to eq(:regular)
  #     expect(@bolt.plate_type).to eq(:ev)
  #     expect(@camaro.plate_type).to eq(:antique)
  #   end
  # end
  # describe 'register_vehicle' do
  #   it 'registers a regular vehicle' do
  #     vehicle = Vehicle.new(year: 2010, engine: :ice)
  #     @facility.register_vehicle(vehicle)
  #     expect(@facility.registered_vehicles).to include(vehicle)
  #   end

  #   it 'registers an antique vehicle' do
  #     vehicle = Vehicle.new(year: 1995, engine: :ice)
  #     @facility.register_vehicle(vehicle)
  #     expect(@facility.registered_vehicles).to include(vehicle)
  #     expect(vehicle.plate_type).to eq(:antique)
  #   end

  #   it 'registers an electric vehicle' do
  #     vehicle = Vehicle.new(year: 2022, engine: :ev)
  #     @facility.register_vehicle(vehicle)
  #     expect(@facility.registered_vehicles).to include(vehicle)
  #     expect(vehicle.plate_type).to eq(:ev)
  #   end

  # end

  # describe 'collected_fees' do
  #   it 'returns $25 for antique vehicles (25 years old or older)' do
  #     vehicle = Vehicle.new(year: 1995, engine: :ice)
  #     expect(@facility.collected_fees(vehicle)).to eq(25)
  #   end

  #   it 'returns $200 for electric vehicles' do
  #     vehicle = Vehicle.new(year: 2020, engine: :ev)
  #     expect(@facility.collected_fees(vehicle)).to eq(200)
  #   end

  #   it 'returns $100 for all other vehicles' do
  #     vehicle = Vehicle.new(year: 2015, engine: :ice)
  #     expect(@facility.collected_fees(vehicle)).to eq(100)
  #   end
  # end

  

  
end
