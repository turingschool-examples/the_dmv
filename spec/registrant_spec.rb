require 'spec_helper'

RSpec.describe Registrant do 
  before(:each) do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
  end
  describe 'can initialize'do
    it 'exists' do 
     expect(registrant_1).to be_a Registrant
    end
  end

  it 'has a name attribute/method' do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1.name).to eq('Bruce')
  end

  it 'has an age attribute/method' do 
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1.age).to eq(18)
  end

  it 'has a permit attribute/method that defaults to false' do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.permit).to be true
    expect(registrant_2.permit).to be false
  end

  it 'has a permit? method' do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.permit?).to be true
    expect(registrant_2.permit?).to be false
  end

  it 'has a license data attribute with false default values' do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
  end

end