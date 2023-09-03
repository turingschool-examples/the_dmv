require './lib/registrant'
require 'rspec'

RSpec.describe Registrant do 
 before(:each) do 
  @registrant_1 = Registrant.new('Bruce', 18, true )
  @registrant_2 = Registrant.new('Penny', 15 )
 end 

  it "has an attributes name" do 
    expect(@registrant_1.name).to eq("Bruce")
    expect(@registrant_1.age).to eq(18)
    expect(@registrant_1.permit?).to eq(true)
  end 

  it "has attributes for registrant2" do
    expect(@registrant_2.name).to eq("Penny")
    expect(@registrant_2.age).to eq(15)
    expect(@registrant_2.permit?).to eq(false)
    # license_data= {:written=>false, :license=>false, renewed=>false}
    # expect(@registrant_2.license_data).to eq(license_data)
    @registrant_2.earn_permit
    expect(@registrant_2.permit?).to eq(true)
  end 
end 


