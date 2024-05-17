require 'spec_helper'

RSpec.describe Registrant do
  before(:each) do
    @registrant_1 = Registrant.new('Bruce', 18, true)
    @registrant_2 = Registrant.new('Penny', 15)
  end

  it "exists" do
    expect(@registrant_1).to be_a Registrant
  end

  it "has readable attributes" do
    expect(@registrant_1.name).to eq("Bruce")
    expect(@registrant_1.age).to be 18
    expect(@registrant_1.permit?).to be true
  end
  
  it "has permit default value of false" do
    expect(@registrant_2.permit?).to be false
  end
  
end


# registrant_1.permit?
# #=> true

# registrant_1.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# registrant_2.name
# #=> "Penny"

# registrant_2.age
# #=> 15

# registrant_2.permit?
# #=> false

# registrant_2.license_data
# #=> {:written=>false, :license=>false, :renewed=>false}

# registrant_2.earn_permit

# registrant_2.permit?
# #=> true