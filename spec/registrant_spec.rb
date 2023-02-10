require 'spec_helper'

RSpec.describe Registrant do
  it 'exists' do
  registrant_1 = Registrant.new('Bruce', 18, true )
  registrant_2 = Registrant.new('Penny', 15 )
  # require 'pry'; binding.pry

  expect(registrant_1).to be_an_instance_of(Registrant)
  end

  it 'registrant_1 can verify name, age, and permit' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
  end

  it 'can create a hash of license data' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    
  end
end