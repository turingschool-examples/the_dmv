require 'rspec'

RSpec.describe FacilitiesByState do
  it 'exists' do
    facilities = FacilitiesByState.new

    expect(facilities).to be_instance_of(FacilitiesByState)
  end

  describe 'OR facilities' do
    it 'can create facilities from OR' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      
      facilities.create_facilities(dmv_or)
      
      expect(facilities.or[0]).to be_instance_of(Facility)
      expect(facilities.or.length).to eq(59)
    end

    it 'has the correct attributes when created' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      
      facilities.create_facilities(dmv_or)

      expect(facilities.or.first.name).to eq("Albany DMV Office")
      expect(facilities.or.first.address).to eq("2242 Santiam Hwy SE, Albany, OR, 97321")
      expect(facilities.or.first.phone).to eq("5419672014")
    end
  end

  describe 'NY facilities' do
    it 'can create facilities from NY' do 
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities(dmv_ny)
      
      expect(facilities.ny[0]).to be_instance_of(Facility)
      expect(facilities.ny.length).to eq(169)
    end

    it 'has the correct attributes when created' do
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities(dmv_ny)

      expect(facilities.ny.first.name).to eq("JAMESTOWN")
      expect(facilities.ny.first.address).to eq("512 WEST 3RD STREET, JAMESTOWN, NY, 14701")
      expect(facilities.ny.first.phone).to eq("7166618220")
    end
  end
  
  describe 'MO facilities' do
    it 'can create facilities from MO' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities(dmv_mo)
      
      expect(facilities.mo[0]).to be_instance_of(Facility)
      expect(facilities.mo.length).to eq(178)
    end

    it 'has the correct attributes when created' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities(dmv_mo)

      expect(facilities.mo.first.name).to eq("SAINTE GENEVIEVE ")
      expect(facilities.mo.first.address).to eq("753 STE. GENEVIEVE DR, STE GENEVIEVE , MO, 63670")
      expect(facilities.mo.first.phone).to eq("5738832344")
    end
  end
  
  describe '#all_facilities' do
    it 'can store all facilities in one array' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      facilities.create_facilities(dmv_or)
      facilities.create_facilities(dmv_ny)
      facilities.create_facilities(dmv_mo)
     
      expect(facilities.all_facilities.length).to eq(406)
    end
  end

  it 'has hours of operation for or facilities' do
    facilities = FacilitiesByState.new
    dmv_or = DmvDataService.new.or_dmv_office_locations

    facilities.create_facilities(dmv_or)

    expect(facilities.or[0].monday_hrs).to eq('Hours not given')
    expect(facilities.or[0].tuesday_hrs).to eq('Hours not given')
    expect(facilities.or[0].wednesday_hrs).to eq('Hours not given')
    expect(facilities.or[0].thursday_hrs).to eq('Hours not given')
    expect(facilities.or[0].friday_hrs).to eq('Hours not given')
  end

  it 'has hours of operation for ny facilities' do
    facilities = FacilitiesByState.new
    dmv_ny = DmvDataService.new.ny_dmv_office_locations

    facilities.create_facilities(dmv_ny)

    expect(facilities.ny[0].monday_hrs).to eq("8:30 AM to 4:15 PM")
    expect(facilities.ny[0].tuesday_hrs).to eq("8:30 AM to 4:15 PM")
    expect(facilities.ny[0].wednesday_hrs).to eq("8:30 AM to 4:15 PM")
    expect(facilities.ny[0].thursday_hrs).to eq("8:30 AM to 5:45 PM")
    expect(facilities.ny[0].friday_hrs).to eq("8:30 AM to 4:15 PM")
  end
end