require 'rspec'
require './lib/registrant'

RSpec.describe do Registrant
  it 'exists' do
    registrant_1 = Registrant.new('Bruce', 18, true)

    expect(registrant_1).to be_an_instance_of(Registrant)
  end
end