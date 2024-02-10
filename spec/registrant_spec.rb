# typed: ignore

require "rspec"
require "./lib/registrant"

RSpec.describe Registrant do # rubocop:disable Metrics/BlockLength
  before(:each) do
    @registrant1 = Registrant.new({
      name: "Bruce",
      age: 18,
      permit: true
    })
    @registrant2 = Registrant.new({
      name: "Penny",
      age: 15
    })
    @registrant3 = Registrant.new({
      name: "Bobby",
      age: 105,
      permit: false,
      license_data: {
        written: true,
        license: true,
        renewed: true
      }
    })
  end

  it "exists" do
    expect(@registrant1).to be_an_instance_of(Registrant)
  end

  it "can be assigned a name, age, and permit" do
    expect(@registrant1.name).to eq("Bruce")
    expect(@registrant1.age).to eq(18)
    expect(@registrant1.permit?).to eq(true)
  end

  it "does not have a permit by default" do
    expect(@registrant2.permit?).to eq(false)
  end

  it "has not completed the written, road, or renewed criteria by default" do
    expect(@registrant1.license_data).to eq({
      written: false,
      license: false,
      renewed: false
    })
  end

  it "can be assigned license data" do
    expect(@registrant3.license_data).to eq({
      written: true,
      license: true,
      renewed: true
    })
  end

  it "can earn a permit" do
    @registrant3.earn_permit
    expect(@registrant3.permit?).to eq(true)
  end
end
