require 'pry'
require './lib/registrant.rb'

RSpec.describe Registrant do

  it "exists" do
    registrant = Registrant.new("Bruce", 18, true)

    expect(registrant).to be_a(Registrant)
  end

  it "has name and age attributes" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.age).to eq(15)
  end

  it "has a permit or not" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    expect(registrant_1.permit?).to be true
    expect(registrant_2.permit?).to be false
  end

  it "contains license data" do
    registrant_1 = Registrant.new("Bruce", 18, true)

    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
  end

  it "can change permit status" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    registrant_2.earn_permit
    binding.pry
    expect(registrant_2.permit?).to be true
  end
end
