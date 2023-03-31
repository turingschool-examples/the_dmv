require "./lib/registrant"

RSpec.describe Registrant do
  it "exist" do
    registrant_1 = Registrant.new("Bruce", 18, true )
    registrant_2 = Registrant.new("Penny", 15 )
    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_1.age). to eq(18)
    expect(registrant_1.permit?).to eq(true)
    # expect(registrant_1.license_data).to eq()
  end
end