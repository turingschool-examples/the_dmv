require './lib/registrant'

RSpec.describe 'Registrant' do

  describe 'Instance' do
    it 'checks if registrant is instance of Registrant' do
      registrant_1 = Registrant.new('Bruce', 18, true )
      registrant_2 = Registrant.new('Penny', 15 )
    end
  end
end