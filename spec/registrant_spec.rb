require 'rspec'
require './lib/registrant'

RSpec.describe do Registrant
  it 'exists' do
    registrant_1 = Registrant.new('Bruce', 18, true)

    expect(registrant_1).to be_an_instance_of(Registrant)
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.name).to eq('Bruce')
    expect(registrant_1.permit).to eq(true)
  end
end