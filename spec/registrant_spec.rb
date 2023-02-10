require './lib/registrant'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
  end

  it 'exists' do
    expect(@registrant_1).to be_instance_of(Registrant)
  end

  it 'has name' do
    expect(@registrant_1.name).to eq("Bruce")
  end

  it 'has age' do
    expect(@registrant_1.age).to eq(18)
  end

  it 'has permit' do
    expect(@registrant_1.permit?).to be true
  end

  it 'has license_data' do
    expect(@registrant_1.license_data).to eq({written: false, license: false, renewed: false})
  end
end