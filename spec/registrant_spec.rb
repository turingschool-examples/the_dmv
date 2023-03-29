require 'spec_helper'

RSpec.describe Registrant do 
  it "exists" do 
    registrant_1 = Registrant.new('Bruce', 18, true )
    expect(registrant_1).to be_a Registrant
  end

  it "has a name attribute/method" do
    registrant_1 = Registrant.new('Bruce', 18, true )

    expect(registrant_1.name).to eq('Bruce')
  end
end