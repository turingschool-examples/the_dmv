require 'spec_helper'

RSpec.configure do |config|
  config.formatter = :documentation
end

RSpec.describe Registrant do

  before(:each) do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
  end 

  describe '#initialize' do
    it 'can initialize' do
      expect(registrant_1).to be_instance_of(Registrant)
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq('18')
      expect(registrant_1.permit?).to eq true
      expect(registrant_1.license_data?).to eq false

      expect(registrant_2).to be_instance_of(Registrant)
      expect(registrant_2.name).to eq('Penny')
      expect(registrant_2.age).to eq('15')
      expect(registrant_2.permit?).to eq false

    end

  end





end