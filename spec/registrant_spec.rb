require "./lib/registrant"
require "./facility"

describe "initialize" do
  it "is an instance of" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    
    expect(registrant_1).to be_an_instance_of(Registrant)

    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_2).to be_an_instance_of(Registrant)
  end

  it "changes the permit value to true" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    registrant_2.earn_permit

    expect(registrant_2.permit?).to eq(true)
  end
end