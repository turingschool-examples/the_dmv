require './lib/registrant'

RSpec.describe Registrant do
  it 'creates a registrant with the given name, age, and permit status' do
    registrant = Registrant.new('Bruce', 18, true)
    expect(registrant.name).to eq('Bruce')
    expect(registrant.age).to eq(18)
    expect(registrant.permit?).to be(true)
    expect(registrant.license_data).to eq({ written: false, license: false, renewed: false })
  end

  it 'creates a registrant with the given name, age, and permit status' do
    registrant = Registrant.new('Penny', 15)
    expect(registrant.name).to eq('Penny')
    expect(registrant.age).to eq(15)
    expect(registrant.permit?).to be(false)
    expect(registrant.license_data).to eq({ written: false, license: false, renewed: false })
  end

  it 'does not give the registrant another permit' do
    registrant = Registrant.new('Bruce', 18, true)
    expect(registrant.permit?).to be(true)
    registrant.earn_permit
    expect(registrant.permit?).to be(true)
  end
end