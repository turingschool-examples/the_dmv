require "./lib/facility.rb"
require "./lib/facility_list.rb"
require "./lib/dmv_data_service.rb"

describe FacilityList do
    it "exists" do
        factory = FacilityList.new

        expect(factory).to be_a FacilityList
    end
end