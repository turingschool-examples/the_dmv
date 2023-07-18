require "spec_helper"

RSpec.describe "#dmv_factory" do
  it "creates a dmv factory" do
    factory = DmvFactory.new
    expect(factory).to be_an_instance_of(DmvFactory)
  end

  it "#creates a new facility" do
    factory = DmvFactory.new

    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations

    factory.create_facilities(co_dmv_office_locations)

    expect(factory.create_facilities(co_dmv_office_locations)[0].name).to eq("DMV Tremont Branch")
    expect(factory.create_facilities(co_dmv_office_locations)[0].address).to eq("2855 Tremont Place, Suite 118, Denver, CO, 80205")
    expect(factory.create_facilities(co_dmv_office_locations)[0].phone).to eq("(720) 865-4600")
  end

  it "creates a new_york_facility" do
    factory = DmvFactory.new

    new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    factory.create_facilities(new_york_facilities)

    expect(factory.create_facilities(new_york_facilities)[0].name).to eq("JAMAICA")
    expect(factory.create_facilities(new_york_facilities)[0].address).to eq("168-46 91ST AVE., 2ND FLR, JAMAICA, NY, 11432")
    expect(factory.create_facilities(new_york_facilities)[0].phone).to eq("7189666155")
  end

  xit "creates a missouri_facility" do
    factory = DmvFactory.new

    missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    factory.create_facilities(missouri_facilities)

    expect(factory.create_facilities(missouri_facilities)[0].name).to eq("DEXTER")
    expect(factory.create_facilities(missouri_facilities)[0].address).to eq("119 VINE ST, DEXTER, MO, 63841")
    expect(factory.create_facilities(missouri_facilities)[0].phone).to eq("(573) 624-8808")
  end
end
