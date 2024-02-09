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

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility.services).to eq([])
      @facility.add_service('New Drivers License')
      @facility.add_service('Renew Drivers License')
      @facility.add_service('Vehicle Registration')
      expect(@facility.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#register_vehicle' do
    it 'cannot register a vehicle if the service is not present at the facility' do
      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )

      expect(@facility.services).to eq []
      expect(@facility.register_vehicle(cruz)). to eq nil
    end

    it 'can register a vehicle' do
      @facility.add_service('Vehicle Registration')

      cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice})
      bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev})

      @facility.register_vehicle(cruz)

      expect(@facility.registered_vehicles).to eq [cruz]

      @facility.register_vehicle(bolt)

      expect(@facility.registered_vehicles).to eq [cruz, bolt]
    end
  end 

  describe '#collect_fee' do
    before(:each) do
      @facility.add_service('Vehicle Registration')
      @cruz = Vehicle.new({vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice} )
      @bolt = Vehicle.new({vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev} )
      @camaro = Vehicle.new({vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice} )
    end

    it 'can collect a fee (regular)' do
      @facility.collect_fee(@cruz)

      expect(@facility.collected_fees).to eq 100
    end

    it 'can collect a fee (ev)' do
      @facility.collect_fee(@bolt)

      expect(@facility.collected_fees).to eq 200
    end
    
    it 'can collect a fee (antique)' do
      @facility.collect_fee(@camaro)
      
      expect(@facility.collected_fees).to eq 25
    end

    it 'can accumulate collected_fees' do
      @facility.collect_fee(@cruz)

      expect(@facility.collected_fees).to eq 100

      @facility.collect_fee(@bolt)

      expect(@facility.collected_fees).to eq 300

      @facility.collect_fee(@camaro)

      expect(@facility.collected_fees).to eq 325
    end
  end 


end
