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
      expect(@facility.collected_fees).to eq 0 
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

  describe '#register vehicle' do
    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(cruz.registration_date).to be nil
      expect(@facility.registered_vehicles).to eq []
      expect(@facility.collected_fees).to eq 0

      @facility.register_vehicle(cruz)

      expect(@facility.registered_vehicles). to eq [cruz]
    end
  end 

  describe '#register vehicle' do
    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(cruz.registration_date).to be nil
      expect(@facility.registered_vehicles).to eq []
      expect(@facility.collected_fees).to eq 0

      @facility.register_vehicle(cruz)

      expect(@facility.registered_vehicles). to eq [cruz]
    end
  end 

  describe '#register vehicle' do
    it 'cannot register a vehicle if the service is not present at the facility' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(@facility.services).to eq []
      expect(@facility.register_vehicle(cruz)). to eq nil
    end
  end 

end
