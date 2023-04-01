require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility = Facility.new({
      name: 'Albany DMV Office', 
      address: '2242 Santiam Hwy SE Albany OR 97321', 
      phone: '541-967-2014' })
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
  
  describe 'can add a service' do
    it 'can add a service' do
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(["Vehicle Registration"])
    end
  end
  
  describe 'has registered_vehicles' do
    it 'has registered_vehicles array' do
      @facility.registered_vehicles
      expect(@facility.registered_vehicles).to eq([])
    end
  end

  describe '#collected_fees' do
    it 'has collected_fees' do
      @facility.collected_fees
      expect(@facility.collected_fees).to eq(0)
    end
  end

  describe 'register_vehicle' do
    it 'can register vehicle' do
      cruz = Vehicle.new({
      vin: '123456789abcdefgh', 
      year: 2012, 
      make: 'Chevrolet', 
      model: 'Cruz', 
      engine: 
      :ice})
      @facility.register_vehicle(cruz)
      expect(@facility.registered_vehicles).to include(cruz)
      expect(cruz.registration_date).to eq(Date.today)
      expect(cruz.plate_type).to eq(:regular)
    end
  end

end
