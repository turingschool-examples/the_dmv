require "spec_helper"

RSpec.describe FacilityFactory do
  

    # @factory = FacilityFactory.new
    # @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    # @new_york_facilities = DmvDataService.new.ny_dmv_office_locations
    # @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

   
  it 'exists' do 
    @factory = FacilityFactory.new
    
    expect(@factory).to be_a(FacilityFactory)
  end 

  it 'can determine name' do 
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations
    
    expect(@factory.determine_name(@oregon_facilities.first)).to eq("Albany DMV Office")
  end

  it 'can determine address' do 
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(@factory.determine_address(@oregon_facilities.first)).to eq("2242 Santiam Hwy SE")
  end

  it 'can determine phone number' do 
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(@factory.determine_phone_num(@oregon_facilities.first)).to eq("541-967-2014")
  end

  it 'can create facility from New York database' do 
    @factory = FacilityFactory.new
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(@factory.facilities).to eq([])
    @factory.create_facilities(@new_york_facilities)
    expect(@factory.facilities.first).to be_a(Facility)
    expect(@factory.facilities.first.name).to eq("SELDEN")
    expect(@factory.facilities.first.address).to eq("407 SELDEN RD")
    
    #the first entry in the database has no number
    #so I'm running the second location for this test
    expect(@factory.facilities[1].phone).to eq("718-526-8546")

  end

  it 'can create facility from Missouri database' do 
    @factory = FacilityFactory.new
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

  end







end

