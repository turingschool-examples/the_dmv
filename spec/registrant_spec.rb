require 'spec_helper'

RSpec.describe Registrant do 
  it "can initialize" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1).to be_a Registrant
    expect(registrant_2).to be_a Registrant
  end


  it 'returns registrant_1 name' do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1.name).to eq('Bruce')
  end

  it 'returns registrant_1 age' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    
    expect(registrant_1.age).to eq(18)
  end

  it 'returns registrant_1 permit' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    
    expect(registrant_1.permit?).to eq(true)
  end
end


      
