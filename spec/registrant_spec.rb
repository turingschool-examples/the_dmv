require 'spec_helper'
require "rspec"
require "./lib/registrant.rb"

RSpec.describe Registrant do
    
    it "exists, has a name, age and reads if has a permit" do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 15 )

        expect(registrant_1).to be_an_instance_of(Registrant)
        expect(registrant_1.name).to eq ("Bruce")
        expect(registrant_2.age).to eq (15)
        expect(registrant_1.permit).to eq(true)
    end
end