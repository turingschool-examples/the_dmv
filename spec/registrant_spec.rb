require './lib/registrant'

RSpec.describe 'Registrant' do
  before(:each) do 
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end

  describe 'Instance' do
    it 'checks if registrant is instance of Registrant' do
      expect(@registrant_1).to be_an_instance_of Registrant
      expect(@registrant_2).to be_an_instance_of Registrant
    end
  end

  describe 'Name' do
    it 'checks registrant has a name' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_2.name).to eq('Penny')
    end
  end

  describe 'Age' do
    it 'Checks registrants age' do
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_2.age).to eq(15)
    end
  end

  describe 'Permit?' do
    it 'checks if registrant has a permit' do
      expect(@registrant_1.permit?).to be(true)
      expect(@registrant_2.permit?).to be(false)

      @registrant_2.earn_permit
      expect(@registrant_2.permit?).to be(true)
    end
  end

  describe 'License data' do
    it 'checks license data' do
      expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
      expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end
  end
end