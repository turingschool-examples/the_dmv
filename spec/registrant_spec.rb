require './lib/registrant'

describe Registrant do
  it 'exists' do
    reg_1 = Registrant.new("Bruce", 18, true)
    reg_2 = Registrant.new("Penny", 15)

    expect(reg_1).to be_an_instance_of(Registrant)
    expect(reg_1.name).to eq("Bruce")
    expect(reg_1.permit).to eq(true)
    expect(reg_2.permit).to eq(false)
  end
end