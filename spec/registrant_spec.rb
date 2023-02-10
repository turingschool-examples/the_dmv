require 'rspec'
require './lib/registrant'

RSpec.describe Registrant do
   
  it 'exist' do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1).to be_a Registrant
  end




end