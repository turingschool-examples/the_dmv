require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 16 )
    @registrant_3 = Registrant.new('Tucker', 15)
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end

  describe '#initialize' do
    it 'exists' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it 'has a name' do
      expect(@registrant_1.name).to eq('Bruce')
    end

    it 'has an age' do
      expect(@registrant_1.age).to eq 18
    end

    it 'does not have a permit by default' do
      expect(@registrant_2.permit).to be false
    end

    it 'has default license data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#permit?' do
    it 'returns whether registrant has permit' do
      expect(@registrant_1.permit?).to be true
      expect(@registrant_2.permit?).to be false
    end
  end

  describe '#earn_permit' do
    it 'changes permit to true' do
      expect(@registrant_2.permit?).to be false
      
      @registrant_2.earn_permit
      
      expect(@registrant_2.permit?).to be true
    end
  end
end