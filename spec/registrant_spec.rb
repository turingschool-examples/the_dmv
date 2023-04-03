require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
    @registrant_3 = Registrant.new('Tucker', 15 )
    @facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
    @facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@registrant_1).to be_an_instance_of(Registrant)
    end

    it 'has attributes' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.permit?).to eq(true)
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

      expect(@registrant_2.name).to eq('Penny')
      expect(@registrant_2.age).to eq(15)
      expect(@registrant_2.permit?).to eq(false)
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end

  describe '#earn_permit' do
    it 'changes permit status from false to true' do
      @registrant_2.earn_permit

      expect(@registrant_2.permit?).to be(true)
    end
  end

  describe 'administers a written test' do
    it 'checks license data' do 
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'checks permit status' do 
      expect(@registrant_1.permit?).to be(true)
    end

    it "does not offer administered written test as a service" do 
      expect(@facility_1.administer_written_test(@registrant_1)).to be(false)
    end

  end

end