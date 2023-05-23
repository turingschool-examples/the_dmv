require 'spec_helper'

RSpec.describe DmvFacility do
  
  describe "#exists" do
    it "exists" do
      
      add_facility1 = DmvDataService.new.or_dmv_office_locations
      # require 'pry'; binding.pry
      expect(add_facility1).to be_a(Array)
      expect(add_facility1[0][:title]).to eq("Albany DMV Office")
        expect(add_facility1[1][:title]).to eq("Ashland DMV Office")
        # expect(add_facility1.create_facilities.access_name).to eq("Albany DMV Office")
    end
  end
end