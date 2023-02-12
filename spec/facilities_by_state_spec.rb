require 'rspec'

RSpec.describe FacilitiesByState do
  it 'exists' do
    facilities = FacilitiesByState.new

    expect(facilities).to be_instance_of(FacilitiesByState)
  end

  it 'can create facilities' do
    facilities = FacilitiesByState.new
    dmv = DmvDataService.new.or_dmv_office_locations

    facilities.create_facilities(dmv)
    
    expect(facilities.all_facilities[0]).to be_instance_of(Facility)
    expect(facilities.all_facilities.length).to eq(59)
  end
  
  it 'can create facilities from NY' do 
    facilities = FacilitiesByState.new
    dmv = DmvDataService.new.ny_dmv_office_locations
    
    facilities.create_facilities(dmv)
    require 'pry'; binding.pry
    expect(facilities.all_facilities[0]).to be_instance_of(Facility)
    expect(facilities.all_facilities.length).to eq(169)
  end
  
  it 'can create facilities from MO' do
    facilities = FacilitiesByState.new
    dmv = DmvDataService.new.mo_dmv_office_locations
    
    facilities.create_facilities(dmv)
    
    expect(facilities.all_facilities[0]).to be_instance_of(Facility)
    expect(facilities.all_facilities.length).to eq(178)
  end
end