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
  end

  it "creates a missouri_facility" do
  end
end
