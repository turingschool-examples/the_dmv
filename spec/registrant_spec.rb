require './lib/registrant'
require 'rspec'

RSpec.describe Registrant do
  
  it 'exists' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    
    expect(registrant_1).to be_instance_of(Registrant)
  end

  it 'has attributes' do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_2.permit).to eq(false)
    expect(registrant_1.permit).to eq(true)
  end

  it 'earns permit' do
    registrant_2 = Registrant.new('Penny', 15 )
    registrant_2.earn_permit

    expect(registrant_2.permit).to eq(true)
  end

  it 'has license data' do
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_2.license_data).to eq({:license=>false, :renewed=>false, :written=>false})
  end
end