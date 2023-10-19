require './spec/spec_helper'

require "pry"

RSpec.describe Registrant do
  it "exists" do
    registrant_1 = Registrant.new

    expect (registrant_1).to be_a Registrant
  end

  it "has a name" do
    registrant_1 = Registrant.new("Bruce",18, true)

  
    expect(registrant_1.name).to eq("Bruce")
  end

  it "has an age" do
    registrant_1 = Registrant.new("Bruce",18, true)

    expect(registrant_1.age).to eq(18)
  end

  it "has a permit value of true or false" do
    registrant_1 = Registrant.new("Bruce",18, true)
    expect(registrant_1.permit).to eq(true)
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_2.permit).to eq(false)
  end
    
    








end