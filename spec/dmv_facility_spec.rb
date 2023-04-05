require 'spec_helper'

RSpec.describe DMVFacility do
  before(:each) do

    @dmv_facility_1 = DMVFacility.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations
  end

  # it "tests this damn method" do 
  #   require 'pry'; binding.pry
  #   @dmv_facility_1.create_facilities(@oregon_facilities)
  #   @dmv_facility_1.create_facilities(@new_york_facilities)
  #   @dmv_facility_1.create_facilities(@missouri_facilities)
  # end
  
  it "exists" do 
    expect(@dmv_facility_1).to be_an_instance_of(DMVFacility)
  end

  it "can make an array of new DMV Facilities from Oregon database" do
    # require 'pry'; binding.pry
    expect(@dmv_facility_1.create_dmvs_or(@oregon_facilities).first).to be_a(Facility)
    expect(@dmv_facility_1.create_dmvs_or(@oregon_facilities)).to be_an(Array)

  end
  
  it "can make an array of new DMV Facilities from New York database" do
    # @dmv_facility_1.create_dmvs(@new_york_facilities)
    expect(@dmv_facility_1.create_dmvs_ny(@new_york_facilities)).to be_an(Array)
    expect(@dmv_facility_1.create_dmvs_ny(@new_york_facilities).first).to be_a(Facility)
  end

  it "can make an array of new DMV Facilities from Missouri database" do
    # @dmv_facility_1.create_dmvs(@new_york_facilities)
    # require 'pry'; binding.pry
    expect(@dmv_facility_1.create_dmvs_mo(@missouri_facilities)).to be_an(Array)
    expect(@dmv_facility_1.create_dmvs_mo(@missouri_facilities).first).to be_a(Facility)
  end

  it "can make an array of new DMV facilities from any database" do 

    expect(@dmv_facility_1.create_facilities(@oregon_facilities)).to be_an(Array)
    expect(@dmv_facility_1.create_facilities(@oregon_facilities.first)).to be_a(Facility)
    expect(@dmv_facility_1.create_facilities(@oregon_facilities.first.name)).to eq("Albany DMV Office")

    expect(@dmv_facility_1.create_facilities(@new_york_facilities)).to be_an(Array)
    expect(@dmv_facility_1.create_facilities(@new_york_facilities.first)).to be_a(Facility)
    expect(@dmv_facility_1.create_facilities(@new_york_facilities.first.name)).to eq("SELDEN")

    expect(@dmv_facility_1.create_facilities(@missouri_facilities)).to be_an(Array)
    expect(@dmv_facility_1.create_facilities(@missouri_facilities.first)).to be_a(Facility)
    expect(@dmv_facility_1.create_facilities(@missouri_facilities.first.name)).to eq("OAKVILLE")
    # expect(@dmv_facility_1.create_dmvs(@oregon_facilities)).to be_an(Array)
    # expect(@dmv_facility_1.create_dmvs(@oregon_facilities).first).to be_a(Facility)
    # expect(@dmv_facility_1.create_dmvs(@oregon_facilities).first.name).to eq("Albany DMV Office")
  #   expect(@dmv_facility_1.create_dmvs(@new_york_facilities)).to be_an(Array)
  #   expect(@dmv_facility_1.create_dmvs(@new_york_facilities).first).to be_a(Facility)
  end

end