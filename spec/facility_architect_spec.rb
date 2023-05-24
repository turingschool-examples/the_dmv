require 'spec_helper'

RSpec.describe FacilityArchitect do
  before(:each) do
    @facility_architect = FacilityArchitect.new
    @or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
  end

  describe 'OR Office' do
    it 'exists' do
      expect(@facility_architect).to be_a(FacilityArchitect)
      expect(@or_dmv_office_locations).to be_a(Array)
      expect(@or_dmv_office_locations.first).to be_a(Hash)
      expect(@or_dmv_office_locations.first[:phone_number]).to eq("541-967-2014")
      expect(@or_dmv_office_locations.first.dig(:location_1, :latitude)).to eq("44.632897")
    end

    it 'can design new facilities from API Call data' do
      or_facility = @facility_architect.or_design_facility(@or_dmv_office_locations)
      expect(or_facility).to be_a(Array)
      expect(or_facility.first).to be_a(Facility)
      expect(or_facility.first.name).to eq("Albany DMV Office")
      expect(or_facility.first.address).to eq("2242 Santiam Hwy SE, Albany, OR, 97321")
      expect(or_facility.first.phone).to eq("541-967-2014")
    end

    it 'has key adder method' do
      unformatted_keys = @or_dmv_office_locations[2]
      expect(unformatted_keys[:name]).to be_nil
      expect(unformatted_keys[:phone]).to be_nil
      expect(unformatted_keys[:address]).to be_nil
      
      facility_array = @facility_architect.or_facility_key_updater(unformatted_keys)

      expect(facility_array.first[:name]).to eq("Astoria DMV Office")
      expect(facility_array.first[:phone]).to eq("503-325-3951")
      expect(facility_array.first[:address]).to eq("705 W Marine Dr, Astoria, OR, 97103")

    end
  end
end


RSpec.describe FacilityArchitect do
  before(:each) do
    @facility_architect = FacilityArchitect.new
    @ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
  end

  describe 'NY Office' do
    it 'exists' do
      expect(@facility_architect).to be_a(FacilityArchitect)
      expect(@ny_dmv_office_locations).to be_a(Array)
      expect(@ny_dmv_office_locations.first).to be_a(Hash)
      expect(@ny_dmv_office_locations.first[:office_name]).to eq("JAMAICA KIOSK")
      expect(@ny_dmv_office_locations[1][:public_phone_number]).to eq("5857531604")
      expect(@ny_dmv_office_locations.first[:georeference][:coordinates][0]).to eq(-73.79219)
    end

    it 'can design new facilities from JSON data' do
      ny_facility = @facility_architect.ny_design_facility(@ny_dmv_office_locations)
      expect(ny_facility).to be_a(Array)
      expect(ny_facility[1]).to be_a(Facility)
      expect(ny_facility[1].name).to eq("Rochester Downtown County Office")
      expect(ny_facility[1].phone).to eq("5857531604")
      expect(ny_facility[1].address).to eq("200 E. Main Street Ste. 101, Rochester Ny, 14604")
    end

    it 'has key adder method' do
      unformatted_keys = @ny_dmv_office_locations[2]
      expect(unformatted_keys[:name]).to be_nil
      expect(unformatted_keys[:phone]).to be_nil
      expect(unformatted_keys[:address]).to be_nil
      
      facility_array = @facility_architect.ny_facility_key_updater(unformatted_keys)

      expect(facility_array.first[:name]).to eq("Millbrook County Office")
      expect(facility_array.first[:phone]).to eq("8456774080")
      expect(facility_array.first[:address]).to eq("15 Merritt Avenue , Millbrook Ny, 12545")

    end
  end
end

RSpec.describe FacilityArchitect do
  before(:each) do
    @facility_architect = FacilityArchitect.new
    @mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations
  end

  describe 'MO Office' do
    it 'exists' do
      expect(@facility_architect).to be_a(FacilityArchitect)
      expect(@mo_dmv_office_locations).to be_a(Array)
      expect(@mo_dmv_office_locations.first).to be_a(Hash)
      expect(@mo_dmv_office_locations.first[:name]).to eq("OAKVILLE")
      expect(@mo_dmv_office_locations.first[:phone]).to eq("(314) 887-1050")
      expect(@mo_dmv_office_locations.first[:address1]).to eq("3164 TELEGRAPH ROAD")
    end

    it 'can design new facilities from JSON data' do
      mo_facility = @facility_architect.mo_design_facility(@mo_dmv_office_locations)
      expect(mo_facility).to be_a(Array)
      expect(mo_facility[0]).to be_a(Facility)
      expect(mo_facility[0].name).to eq("Oakville")
      expect(mo_facility[0].phone).to eq("(314) 887-1050")
      expect(mo_facility[0].address).to eq("3164 Telegraph Road, St Louis Mo, 63125")
    end

    it 'has key adder method' do
      unformatted_keys = @mo_dmv_office_locations[14]
      expect(unformatted_keys[:name]).to eq("BELTON")
      expect(unformatted_keys[:address]).to be_nil
      
      facility_array = @facility_architect.mo_facility_key_updater(unformatted_keys)

      expect(facility_array.first[:name]).to eq("Belton")
      expect(facility_array.first[:address]).to eq("325 Main Street, Belton Mo, 64012")

    end
  end
end