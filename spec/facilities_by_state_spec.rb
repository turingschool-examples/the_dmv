require 'rspec'

RSpec.describe FacilitiesByState do
  it 'exists' do
    facilities = FacilitiesByState.new

    expect(facilities).to be_instance_of(FacilitiesByState)
  end

  it 'can create facilities from OR' do
    facilities = FacilitiesByState.new
    dmv_or = DmvDataService.new.or_dmv_office_locations

    facilities.create_facilities("or", dmv_or)

    expect(facilities.or[0]).to be_instance_of(Facility)
    expect(facilities.or.length).to eq(59)
  end
  
  xit 'can create facilities from NY' do 
    facilities = FacilitiesByState.new
    dmv_ny = DmvDataService.new.ny_dmv_office_locations
    
    facilities.create_facilities("ny", dmv_ny)

    expect(facilities.ny[0]).to be_instance_of(Facility)
    expect(facilities.ny.length).to eq(169)
  end
  
  xit 'can create facilities from MO' do
    facilities = FacilitiesByState.new
    dmv_mo = DmvDataService.new.mo_dmv_office_locations
    
    facilities.create_facilities("mo", dmv_mo)
    
    expect(facilities.mo[0]).to be_instance_of(Facility)
    expect(facilities.mo.length).to eq(178)
  end
end