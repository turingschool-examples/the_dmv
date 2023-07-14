require "./lib/registrant"

describe "initialize" do
  it "is an instance of" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    
    expect(registrant_1).to be_an_instance_of(Registrant)

    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_2).to be_an_instance_of(Registrant)
  end
end