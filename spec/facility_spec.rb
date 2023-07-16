require 'spec_helper'

RSpec.describe Facility do
  before do
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', 
    address: '2855 Tremont Place Suite 118 Denver CO 80205', 
    phone: '(720) 865-4600'
    })
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', 
    address: '4685 Peoria Street Suite 101 Denver CO 80239', 
    phone: '(720) 865-4600'
    })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@facility_1).to be_a(Facility)
      expect(@facility_2).to be_a(Facility)
    end
  end

  describe '#attributes' do
    it 'has readable attributes' do
      expect(@facility_1.name).to eq('DMV Tremont Branch')
      expect(@facility_1.address).to eq('2855 Tremont Place Suite 118 Denver CO 80205')
      expect(@facility_1.phone).to eq('(720) 865-4600')
      expect(@facility_1.services).to eq([])

      expect(@facility_2.name).to eq('DMV Northeast Branch')
      expect(@facility_2.address).to eq('4685 Peoria Street Suite 101 Denver CO 80239')
      expect(@facility_2.phone).to eq('(720) 865-4600')
      expect(@facility_2.services).to eq([])
    end
  end

  describe '#add_service' do
    it 'can add available services' do
      expect(@facility_1.services).to eq([])
      
      @facility_1.add_service('New Drivers License')
      @facility_1.add_service('Renew Drivers License')
      @facility_1.add_service('Vehicle Registration')
      expect(@facility_1.services).to eq(['New Drivers License', 'Renew Drivers License', 'Vehicle Registration'])
    end
  end

  describe '#registered_vehicles' do
    xit 'can register vehicles' do
      excpect(facility_1.register_vehicle(cruz)).to eq
    

      require 'pry';binding.pry
    end
  end
end
