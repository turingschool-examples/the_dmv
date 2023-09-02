require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do #how does scope this work, where does the end go
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 ) #was age 15 before, changed following interaction pattern
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'DMV Tremont Branch', address: '2855 Tremont Place Suite 118 Denver CO 80205', phone: '(720) 865-4600'})
    @facility_2 = Facility.new({name: 'DMV Northeast Branch', address: '4685 Peoria Street Suite 101 Denver CO 80239', phone: '(720) 865-4600'})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
      expect(@registrant_2).to be_an_instance_of(Registrant) 
    end
    it 'can store a name' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
    end
    it 'can store an age' do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(16)
    end
    it 'can store permit status but is false by default' do
      expect(@registrant_1.permit).to eq(true)
      expect(@registrant_2.permit).to eq(false)
    end
  end
  describe '#earn_permit' do  
    it '#earn_permit changes permit status to true' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit).to eq(true)
    end
  end

  describe '#administer written test' do
    it '#accesses registrant license data' do
      expect(@registrant_1.instance_variable_get(:@license_data).length).to eq(3)
      expect(@registrant_1.permit?).to eq(false)
    end

    it '#does not administer without offering' do
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(false)
      facility_1.add_service('Written Test')
      expect(@facility_1.administer_written_test(@registrant_1)).to eq(true)
    end

    it '#changes hash to true after administering' do
      @facility_1.add_service('Written Test')
      @facility_1.administer_written_test(@registrant_1)
      expect(@registrant_1.license_data(:license)).to eq(true)
    end
  end
end