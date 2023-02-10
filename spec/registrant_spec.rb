require 'spec_helper'

RSpec.describe Registrant do
  describe '#Iteration 1' do
    before(:each) do
      @registrant_1 = Registrant.new('Bruce', 18, true)
      @registrant_2 = Registrant.new('Penny', 16)
      @registrant_3 = Registrant.new('Tucker' 15)

      @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
      @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
    end

    it 'has a name and age' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.name).to eq('Penny')
    end

    it 'has no permit by default' do
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_2.permit?).to eq(false)
    end

    it 'has license_data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can earn a permit' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end

  describe 'Iteration 2: Getting a Drivers License' do
    it 'can administer a test to registrant_1 after service added' do
      expect(@facility_1.administer_written_test(@registrant_1)).to be false

      @facility_1.add_service('Written Test')

      expect(@facility_1.administer_written_test(@registrant_1)).to be true
    end
  end
end