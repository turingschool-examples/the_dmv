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

describe "#permit?" do
  it "checkd permit status" do
    reg_1 = Registrant.new("Bruce", 18, true)
    reg_2 = Registrant.new("Penny", 15)
    perm_1 = reg_1.permit?
    perm_2 = reg_2.permit?

    expect(perm_1).to eq(true)
    expect(perm_2).to eq(false)
  end
end

describe "#earn_permit" do
  it "changes permit to true" do
    reg_1 = Registrant.new("Penny", 15)

    expect(reg_1.permit).to eq(false)

    perm_1 = reg_1.earn_permit

    expect(reg_1.permit).to eq(true)
  end
end
