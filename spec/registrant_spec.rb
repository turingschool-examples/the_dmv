require 'spec_helper'

RSpec.describe Registrant do 
  it "can initialize" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )

    expect(registrant_1).to be_a Registrant
    expect(registrant_2).to be_a Registrant
  end
end

  describe 


      
