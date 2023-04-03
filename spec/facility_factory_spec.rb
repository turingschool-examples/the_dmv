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







end

