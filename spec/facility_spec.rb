require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
    @cruz = Vehicle.new({ vin: '123456789abcdefgh', year: 2012, make: 'Chevrolet', model: 'Cruz', engine: :ice })
    @bolt = Vehicle.new({ vin: '987654321abcdefgh', year: 2019, make: 'Chevrolet', model: 'Bolt', engine: :ev })
    @camaro = Vehicle.new({ vin: '1a2b3c4d5e6f', year: 1969, make: 'Chevrolet', model: 'Camaro', engine: :ice })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_an_instance_of(Facility)
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])
      expect(@facility_2).to be_an_instance_of(Facility)
      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
    end
  end

  describe '#add service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['Vehicle Registration'])
      expect(@facility_2.services).to eq([])
    end
  end

  # describe 'can register a vehicle' do
  #   it 'Greater than 25 years old are antique and cost $25' do
  #     expect()
      
      
  #     expect(@facility_1.register_vehicle).to eq
  #   end
  # end
  
  describe 'registered_vehicles' do
    it 'can add a registered vehicle to list of registered vehicles' do
      expect(@facility_1.registered_vehicles).to eq[]
      @facility_1.register_vehicles[@cruz]
      expect(@facility_1.registered_vehicles).to eq[@cruz]
      @facility_1.registered_vehicles[@camaro]
      expect(@facility_1.registered_vehicles).to eq[@cruz, @camaro]

    end
  end

  describe 'collected_fees' do
    it 'can collect fees from services performmed' do
      expect(@facility_1.collected_fees).to eq(0)
      @facility_1.collected_fees(100)
      expect(@facility_1.collected_fees).to eq(100)
      @facility_1.collected_fees()
    end
  end



  # describe 'registration_date' do
  #   it 'can add a registration date' do
  #     expect(@cruz.registration_date).to eq()
  #   end
  # end
end

