require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end
  
  describe 'exists'
    it 'is an instance of' do
    expect(@facility_1).to be_an_instance_of(Facility)
    expect(@facility_2).to be_an_instance_of(Facility)
  end
  
  describe '#initialize' do
    it 'has a name' do
      expect(@facility_1.name).to eq('Albany DMV Office')
      expect(@facility_2.name).to eq('Ashland DMV Office')
    end


    it 'has an address' do
       expect(@facility_1.address).to eq('2242 Santiam Hwy SE Albany OR 97321')
       expect(@facility_2.address).to eq('600 Tolman Creek Rd Ashland OR 97520')
    end

    it 'has a phone number' do
      expect(@facility_1.phone).to eq('541-967-2014')
      expect(@facility_2.phone).to eq('541-776-6092')
    end

    it 'has services' do
      expect(@facility_1.services).to eq([])
      expect(@facility_2.services).to eq([])
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
end
