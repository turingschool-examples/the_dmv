require './lib/registrant'

RSpec.describe Registrant do
  it 'exists' do
    bruce = Registrant.new('Bruce', 18, true)

    expect(bruce).to be_instance_of(Registrant)
  end
end