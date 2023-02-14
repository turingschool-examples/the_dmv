require './lib/registrant'

RSpec.describe Registrant do 
  it 'exists' do 

  expect(registrant_1 = Registrant.new('Bruce', 18, true)).to be_a(Registrant)
  end

  it 'has attributes' do
    registrant_1 = Registrant.new('Bruce', 18, true)

    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit).to eq(true)
  end

  it 'permits are false if not specified' do
    registrant_2 = Registrant.new('Penny', 15)
    expect(registrant_2.permit?).to eq(false)
  end

  it 'allows registrants to earn permits' do
  registrant_2 = Registrant.new('Penny', 15 )
  registrant_2.earn_permit
  
  expect(registrant_2.permit?).to eq(true)
  end

  it 'stores license data in a hash' do
    registrant_2 = Registrant.new('Penny', 15)
    
    expect(registrant_2.license_data).to eq({:written => false, :license => false, :renewed => false})
  end
end