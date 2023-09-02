require 'spec_helper'
require './lib/registrant'

RSpec.describe Vehicle do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end
  describe '#initialize' do
    it 'will initialize' do
      expect(@registrant_1.name).to eq('Bruce')
      expect(@registrant_1.age).to eq(18)
      expect(@registrant_1.license_data[:written]).to eq(false)
      expect(@registrant_1.license_data[:license]).to eq(false)
      expect(@registrant_1.license_data[:renewed]).to eq(false)
    end
  end
  describe '#permit?' do 
   it 'will say if there is a permit' do
     expect(@registrant_1.permit?).to eq(true)
   end
  end
end

