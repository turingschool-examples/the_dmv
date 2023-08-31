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
    it 'checks registrants name' do
      expect(@registrant_1.name).to eq('Bruce')
    end
  end

  describe 'Age' do
    it 'Checks registrants age' do
      expect(@registrant_1.age).to eq(18)
    end
  end
  registrant_1.age
  registrant_1.permit?
  registrant_1.license_data
end