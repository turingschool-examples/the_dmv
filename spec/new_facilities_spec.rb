require './lib/new_facilities'  

RSpec.describe FacilityBuilder do
  it 'exists' do
    facility = FacilityBuilder.new

    expect(facility).to be_a(FacilityBuilder)
  end

  it 'recognizes data types from Oregon JSON' do 
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations

    expect(or_dmv_office_locations).to be_a(Array)
    expect(or_dmv_office_locations.first).to be_a(Hash)
    expect(or_dmv_office_locations.length).to eq(59)

    or_dmv_office_locations.each do |dmv| 
      expect(dmv).to have_key(:title)
      expect(dmv[:title]).to be_a(String)
      expect(dmv[:location_1]).to have_key(:human_address)
      expect(dmv[:location_1][:human_address]).to be_a(String)
      # require 'pry'; binding.pry
    end

    facility = FacilityBuilder.new

    or_facilities = facility.create_facilities(or_dmv_office_locations)

    expect(or_facilities).to be_a(Array)
    expect(or_facilities.first).to be_a(Facility)
  end

  describe '#NYS locations tests' do 
    it 'can work with NYS JSON file' do
      ny_dmv_office_locations =  DmvDataService.new.ny_dmv_office_locations
      
      expect(ny_dmv_office_locations).to be_a(Array)
      expect(ny_dmv_office_locations.first).to be_a(Hash)
      expect(ny_dmv_office_locations.length).to eq(172)

      facility = FacilityBuilder.new
      ny_facilities = facility.create_facilities(ny_dmv_office_locations)

      expect(ny_facilities).to be_a(Array)
      expect(ny_facilities.first).to be_a(Facility)

      ny_dmv_office_locations.each do |dmv| 
        expect(dmv).to have_key(:office_name)
        expect(dmv[:office_name]).to be_a(String)
        expect(dmv[:street_address_line_1]).to be_a(String)
      end
    end
  end

  describe '#MO locations tests' do 
    it 'can work with MO JSON file' do
      mo_dmv_office_locations =  DmvDataService.new.mo_dmv_office_locations
      
      expect(mo_dmv_office_locations).to be_a(Array)
      expect(mo_dmv_office_locations.first).to be_a(Hash)
      expect(mo_dmv_office_locations.length).to eq(178)

      facility = FacilityBuilder.new
      mo_facilities = facility.create_facilities(mo_dmv_office_locations)

      expect(mo_facilities).to be_a(Array)
      expect(mo_facilities.first).to be_a(Facility)

      mo_dmv_office_locations.each do |dmv| 
        expect(dmv).to have_key(:dorregionnumber)
        expect(dmv[:name]).to be_a(String)
        expect(dmv[:address1]).to be_a(String)
      end
    end
  end
end