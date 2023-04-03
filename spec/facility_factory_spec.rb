require "spec_helper"

RSpec.describe FacilityFactory do
   
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

    expect(@factory.facilities).to eq([])
    @factory.create_facilities(@missouri_facilities)
    expect(@factory.facilities.first).to be_a(Facility)
    expect(@factory.facilities.first.name).to eq("OAKVILLE")
    expect(@factory.facilities.first.address).to eq("3164 TELEGRAPH ROAD")
    expect(@factory.facilities.first.phone).to eq("314-887-1050")
  end

  #I'll now make sure everything is running properly by testing 
  #other locations in each database 

  it 'can test facility 3 in Oregon' do 
    @factory = FacilityFactory.new
    @oregon_facilities = DmvDataService.new.or_dmv_office_locations

    expect(@factory.facilities).to eq([])
    @factory.create_facilities(@oregon_facilities)
    expect(@factory.facilities[2]).to be_a(Facility)
    expect(@factory.facilities[2].name).to eq("Astoria DMV Office")
    expect(@factory.facilities[2].address).to eq("705 W Marine Dr")
    expect(@factory.facilities[2].phone).to eq("503-325-3951")
  end 

  it 'can test facility 3 in New York' do 
    @factory = FacilityFactory.new
    @new_york_facilities = DmvDataService.new.ny_dmv_office_locations

    expect(@factory.facilities).to eq([])
    @factory.create_facilities(@new_york_facilities)
    expect(@factory.facilities[2]).to be_a(Facility)
    expect(@factory.facilities[2].name).to eq("SARANAC LAKE")
    expect(@factory.facilities[2].address).to eq("39 MAIN STREET")
    expect(@factory.facilities[2].phone).to eq("518-891-1748")
  end 

  it 'can test facility 3 in Missouri' do 
    @factory = FacilityFactory.new
    @missouri_facilities = DmvDataService.new.mo_dmv_office_locations

    expect(@factory.facilities).to eq([])
    @factory.create_facilities(@missouri_facilities)
    expect(@factory.facilities[2]).to be_a(Facility)
    expect(@factory.facilities[2].name).to eq("LICKING (closed)")
    expect(@factory.facilities[2].address).to eq("117A NORTH MAIN")
    expect(@factory.facilities[2].phone).to eq(nil)
  end
end

