require 'spec_helper.rb'


RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15,  )  
  end

  describe 'exists'
    it 'is an instance of' do
    expect(@registrant_1).to be_an_instance_of(Registrant)
    expect(@registrant_2).to be_an_instance_of(Registrant)
  end

  describe '#initialize' do
    it 'has a name' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
    end

    it 'has an age' do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end

    it "has license data" do
      expect(@registrant_1.license_data).to eq({:written=>false, 
                                                :license=>false,
                                                :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, 
                                                :license=>false,
                                                :renewed=>false})
      end
    end

  describe '#has_permit?' do
    it 'shows registrants permit status' do
      expect(@registrant_1.permit?).to eq(true)
    end
  end
  
  describe '#earn_permit' do
    it 'shows registrant has earned their permit' do
      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to eq(true)
    end
  end
end