require 'spec_helper'

RSpec.describe FacilityFactory do
  describe "Iteration 3" do
    it "exists" do
      facility = FacilityFactory.new
      
      expect(facility).to be_a(FacilityFactory)
    end

    xit "creates new facilities from oregon data set" do
      facility = FacilityFactory.new
      oregon = DmvDataService.new.or_dmv_office_locations
      
      
      facilities = facility.create_facility(oregon)
      
      
      expect(facilities[0].name).to eq("Albany DMV Office")
      expect(facilities[0].phone).to eq("541-967-2014")
      expect(facilities[2].phone).to eq("503-325-3951")
      expect(facilities[4].name).to eq("Beaverton DMV Office")
      expect(facilities[0].address).to eq("{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}")
      expect(facilities[0].zipcode).to eq("97321")
    end
    
    xit "creates new facilities from new york data set" do
      facility = FacilityFactory.new
      new_york_facilities = DmvDataService.new.ny_dmv_office_locations

      ny_facilities = facility.create_facility(new_york_facilities)
      expect(ny_facilities[0].name).to eq("SELDEN")
      expect(ny_facilities[0].address).to eq("407 SELDEN RD")
      expect(ny_facilities[0].zipcode).to eq("11784")
      expect(ny_facilities[0].phone).to eq(nil)
      expect(ny_facilities[1].phone).to eq("7185268546")
      expect(ny_facilities[2].address).to eq("39 MAIN STREET")
      expect(ny_facilities[3].zipcode).to eq("12072")
      expect(ny_facilities[6].name).to eq("OLEAN")
    end
    
    it "creates new facilities from missouri dmv data set" do
      facility = FacilityFactory.new
      missouri_facilities = DmvDataService.new.mo_dmv_office_locations
      
      mizzou_facilities = facility.create_facility(missouri_facilities)

      expect(mizzou_facilities[0].name).to eq("OAKVILLE")
      expect(mizzou_facilities[3].address).to eq("105 Armory ST")
      expect(mizzou_facilities[11].phone).to eq("(636) 464-3330")
      expect(mizzou_facilities[55].zipcode).to eq("65807")
    end
  end
end