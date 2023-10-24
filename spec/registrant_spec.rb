require './spec/spec_helper'

require "pry"

RSpec.describe Registrant do
  it "exists" do
    registrant_1 = Registrant.new("Bruce",18, true)
    expect(registrant_1).to be_a Registrant
  end

  it "has a name and a different name" do
    registrant_1 = Registrant.new("Bruce",18, true)
    expect(registrant_1.name).to eq("Bruce")
    registrant_2 = Registrant.new("Penny", 15)
    expect(registrant_2.name).to eq("Penny")
  end

  it "has an age and a different age" do
    registrant_1 = Registrant.new("Bruce",18, true)
    expect(registrant_1.age).to eq(18)
    registrant_2 = Registrant.new("Penny",15)
    expect(registrant_2.age).to eq(15)
  end

  it "has default license data" do
    registrant_1 = Registrant.new("Bruce",18, true)
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it "has a permit value of true or false" do
    registrant_1 = Registrant.new("Bruce",18, true)
    expect(registrant_1.permit).to eq(true)
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_2.permit).to eq(false)
  end
    
  it "has a method to change permit value, earn permit" do
    registrant_2 = Registrant.new('Penny', 15)
    expect(registrant_2.permit?).to eq false
    expect(registrant_2.earn_permit).to eq(true)
  end

  







end