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
      
      facilities.create_facilities("or", dmv_or)
      
      expect(facilities.or[0]).to be_instance_of(Facility)
      expect(facilities.or.length).to eq(59)
    end

    it 'has the correct attributes when created' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      
      facilities.create_facilities("or", dmv_or)

      expect(facilities.or.first.name).to eq("Albany DMV Office")
      expect(facilities.or.first.address).to eq("2242 Santiam Hwy SE, Albany, OR, 97321")
      expect(facilities.or.first.phone).to eq("5419672014")
    end

    it 'can take capitilized state abbreviation to create facilities' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      
      facilities.create_facilities("OR", dmv_or)

      expect(facilities.or.length).to eq(59)
    end

    it 'can take full state name to create facilities' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      
      facilities.create_facilities("oregon", dmv_or)

      expect(facilities.or.length).to eq(59)
    end

    it 'can take full state name capitilized to create facilities' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      
      facilities.create_facilities("Oregon", dmv_or)

      expect(facilities.or.length).to eq(59)
    end
  end

  describe 'NY facilities' do
    it 'can create facilities from NY' do 
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities("ny", dmv_ny)
      
      expect(facilities.ny[0]).to be_instance_of(Facility)
      expect(facilities.ny.length).to eq(169)
    end

    it 'has the correct attributes when created' do
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities("ny", dmv_ny)

      expect(facilities.ny.first.name).to eq("JAMESTOWN")
      expect(facilities.ny.first.address).to eq("512 WEST 3RD STREET, JAMESTOWN, NY, 14701")
      expect(facilities.ny.first.phone).to eq("7166618220")
    end

    it 'can take capitilized state abbreviation to create facilities' do
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities("NY", dmv_ny)

      expect(facilities.ny.length).to eq(169)
    end

    it 'can take full state name to create facilities' do
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities("new york", dmv_ny)

      expect(facilities.ny.length).to eq(169)
    end

    it 'can take full state name capitilized to create facilities' do
      facilities = FacilitiesByState.new
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      
      facilities.create_facilities("New York", dmv_ny)

      expect(facilities.ny.length).to eq(169)
    end
  end
  
  describe 'MO facilities' do
    it 'can create facilities from MO' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities("mo", dmv_mo)
      
      expect(facilities.mo[0]).to be_instance_of(Facility)
      expect(facilities.mo.length).to eq(178)
    end

    it 'has the correct attributes when created' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities("mo", dmv_mo)

      expect(facilities.mo.first.name).to eq("SAINTE GENEVIEVE ")
      expect(facilities.mo.first.address).to eq("753 STE. GENEVIEVE DR, STE GENEVIEVE , MO, 63670")
      expect(facilities.mo.first.phone).to eq("5738832344")
    end

    it 'can take capitilized state abbreviation to create facilities' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities("MO", dmv_mo)

      expect(facilities.mo.length).to eq(178)
    end

    it 'can take full state name to create facilities' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities("missouri", dmv_mo)

      expect(facilities.mo.length).to eq(178)
    end

    it 'can take full state name capitilized to create facilities' do
      facilities = FacilitiesByState.new
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      
      facilities.create_facilities("Missouri", dmv_mo)

      expect(facilities.mo.length).to eq(178)
    end
  end
  
  describe '#all_facilities' do
    it 'can store all facilities in one array' do
      facilities = FacilitiesByState.new
      dmv_or = DmvDataService.new.or_dmv_office_locations
      dmv_ny = DmvDataService.new.ny_dmv_office_locations
      dmv_mo = DmvDataService.new.mo_dmv_office_locations
      facilities.create_facilities("or", dmv_or)
      facilities.create_facilities("New York", dmv_ny)
      facilities.create_facilities("Missouri", dmv_mo)
      
      expect(facilities.all_facilities.length).to eq(406)
    end
  end
end