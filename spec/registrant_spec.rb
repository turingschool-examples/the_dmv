require "spec_helper"

describe "initialize" do
  it "is an instance of" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    expect(registrant_1).to be_an_instance_of(Registrant)

    registrant_2 = Registrant.new("Penny", 15)
    expect(registrant_2).to be_an_instance_of(Registrant)
  end

  it "has a name and age" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    expect(registrant_1.name).to eq("Bruce")
    expect(registrant_2.name).to eq("Penny")

    expect(registrant_1.age).to eq(18)
    expect(registrant_2.age).to eq(15)
  end

  it "checks license data" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    expect(registrant_1.license_data).to eq({written: false, license: false, renewed: false})
    expect(registrant_2.license_data).to eq({written: false, license: false, renewed: false})
  end

  it "checks the permit value" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    expect(registrant_1.permit?).to eq(true)
    expect(registrant_2.permit?).to eq(false)
  end

  it "changes the permit value to true" do
    registrant_1 = Registrant.new("Bruce", 18, true)
    registrant_2 = Registrant.new("Penny", 15)

    expect(registrant_1.permit?).to eq(true)
    expect(registrant_2.permit?).to eq(false)

    registrant_1.earn_permit
    registrant_2.earn_permit

    expect(registrant_1.permit?).to eq(true)
    expect(registrant_2.permit?).to eq(true)
  end
end
