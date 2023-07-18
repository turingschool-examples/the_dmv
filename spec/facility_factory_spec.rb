require 'spec_helper'

RSpec.describe FacilityFactory do
  it "CO" do
    factory = FacilityFactory.new
    co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
    factory.create_facilities(co_dmv_office_locations)
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array

    #dependent upon when api is taken
    # expect(factory.facilities.first.name).to eq("DMV Tremont Branch")
    # expect(factory.facilities.first.address).to eq("2855 Tremont Place Suite 118 Denver CO 80205")
    # expect(factory.facilities.first.phone).to eq("(720) 865-4600")
    # expect(factory.facilities.first.services).to eq([])
    # expect(factory.facilities.first.registered_vehicles).to eq([])
  end

  it "NY" do
    factory = FacilityFactory.new
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    factory.create_facilities(ny_dmv_office_locations)
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array

    #dependent upon when api is taken
    # expect(factory.facilities.first.name).to eq("JAMAICA")
    # expect(factory.facilities.first.address).to eq("168-46 91ST AVE., 2ND FLR JAMAICA NY 11432")
    # expect(factory.facilities.first.phone).to eq("(718) 966-6155")
    # expect(factory.facilities.first.services).to eq([])
    # expect(factory.facilities.first.registered_vehicles).to eq([])
  end

  it "MO" do
    factory = FacilityFactory.new
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
    factory.create_facilities(mo_dmv_office_locations)
    expect(factory.facilities).to all be_a Facility
    expect(factory.facilities).to be_an Array
    
    #dependent upon when api is taken
    # expect(factory.facilities.first.name).to eq("DEXTER")
    # expect(factory.facilities.first.address).to eq("119 VINE ST DEXTER MO 63841")
    # expect(factory.facilities.first.phone).to eq("(573) 624-8808")
    # expect(factory.facilities.first.services).to eq([])
    # expect(factory.facilities.first.registered_vehicles).to eq([])
  end
end