require 'spec_helper'

RSpec.describe Registrant do
  it 'exists' do
    registrant = Registrant.new("x",3)
    expect(registrant).to be_an_instance_of(Registrant)
  end

  it "has atttibutes" do
    registrant = Registrant.new('Bruce', 18, true )
    expect(registrant.name).to eq("Bruce")
    expect(registrant.age).to eq(18)
    expect(registrant.permit?).to eq(true)
  end

  it "can be updated" do
    registrant_1 = Registrant.new('Bruce', 18, true )
    registrant_2 = Registrant.new('Penny', 15 )
    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_1.age).to eq(18)
    expect(registrant_1.permit?).to eq(true)
    expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})

    expect(registrant_2.name).to eq("Penny")
    expect(registrant_2.age).to eq(15)
    expect(registrant_2.permit?).to eq(false)
    expect(registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    expect(registrant_2.earn_permit).to eq(true)
  end
end