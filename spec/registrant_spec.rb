require "./lib/registrant"

RSpec.describe Registrant do
  it "exists" do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1).to be_an_instance_of(Registrant)
  end
  
  it "has attributes" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    r1_data = {
      :written  =>  false,
      :license  =>  false, 
      :renewed  =>  false
    }

    r2_data = {
      :written  =>  false,
      :license  =>  false,
      :renewed  =>  false
    }

    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to be true
    expect(registrant_1.license_data).to eq(r1_data)
    expect(registrant_1.license_data[:written]).to be false
    expect(registrant_2.permit?).to be false
    expect(registrant_2.license_data).to eq(r2_data)
  end
end