require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true )
    @registrant_2 = Registrant.new('Penny', 15 )
  end
  def '#initialize'do
    it 'will initialize' do
      expect(registrant_1.name).to eq('Bruce')
      expect(registrant_1.age).to eq(18)
      expect(registrant_1.permit?).to eq(true)
  end
end

