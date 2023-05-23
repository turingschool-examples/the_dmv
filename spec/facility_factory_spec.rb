require "spec_helper"

describe "FacilityFactory" do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @or_dmvs = DmvDataService.new.or_dmv_office_locations
    @ny_dmvs = DmvDataService.new.ny_dmv_office_locations
    @mo_dmvs = DmvDataService.new.mo_dmv_office_locations
  end

  describe "#initialize" do
    it "exists" do
      expect(@facility_factory).to be_a(FacilityFactory)
    end
  end

  describe "#create_facilities" do
    it "returns an array of Facilities" do
      facilities = @facility_factory.create_facilities(@or_dmvs)
      first_facility = facilities.first
      
      expect(facilities).to be_a(Array)
      expect(facilities.count).to eq(59)
      expect(first_facility).to be_a(Facility)
    end
  end

  describe "#format_name" do
    it "can format a facility name from the Oregon API" do
      or_facility = @or_dmvs.first
      name_or = @facility_factory.format_name(or_facility)
      expect(name_or).to be_a(String)
    end
    
    it "can format a facility name from the New York API" do
      ny_facility = @ny_dmvs.first
      name_ny = @facility_factory.format_name(ny_facility)
      expect(name_ny).to be_a(String)
    end
    
    it "can format a facility name from the Missouri API" do
      mo_facility = @mo_dmvs.first
      name_mo = @facility_factory.format_name(mo_facility)
      expect(name_mo).to be_a(String)
    end
  end
  
  describe "#format_address" do
    it "can format an address from the Oregon API" do
      or_facility = @or_dmvs.first
      special_or_facility = @or_dmvs.find { |facility| facility[:location_2] }

      address1 = @facility_factory.format_address(or_facility)
      address2 = @facility_factory.format_address(special_or_facility) 

      expect(address1).to be_a(String)
      expect(address2).to be_a(String)
    end
    
    it "can format an address from the New York API" do
      ny_facility = @ny_dmvs.first
      special_ny_facility = @ny_dmvs.find { |facility| facility[:street_address_line_2] }

      address1 = @facility_factory.format_address(ny_facility)
      address2 = @facility_factory.format_address(special_ny_facility) 

      expect(address1).to be_a(String)
      expect(address2).to be_a(String)
    end
    
    it "can format an address from the Missouri API" do
      mo_facility = @mo_dmvs.first

      address = @facility_factory.format_address(mo_facility)
      expect(address).to be_a(String)
    end
  end
  
  describe "#format_phone" do
    it "can format a phone number from the Oregon API" do
      or_facility = @or_dmvs.first
      phone = @facility_factory.format_phone(or_facility) 

      expect(phone).to be_a(String)
      expect(phone.length).to be 14
    end
    
    it "can format a phone number from the New York API" do
      phoned_ny_facility = @ny_dmvs.find { |facility| facility[:public_phone_number] }
      phoneless_ny_facility = @ny_dmvs.find { |facility| !facility[:public_phone_number] }

      phone1 = @facility_factory.format_phone(phoned_ny_facility)
      phone2 = @facility_factory.format_phone(phoneless_ny_facility) 

      expect(phone1).to be_a(String)
      expect(phone1.length).to be 14
      expect(phone2).to be_a(String)
      expect(phone2).to eq ""
    end

    it "can format a phone number from the Missouri API" do
      mo_facility = @mo_dmvs.first
      phone = @facility_factory.format_phone(mo_facility) 

      expect(phone).to be_a(String)
      expect(phone.length).to be 14
    end
  end

end