require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_factory'

RSpec.describe FacilityFactory do

    let(:oregon) do
        {:title=>"Albany DMV Office",
            :zip_code=>"97321",
            :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx",
            :type=>"DMV Location",
            :phone_number=>"541-967-2014",
            :agency=>"Transportation, Department of ",
            :location_1=>
            {:latitude=>"44.632897",
                :longitude=>"-123.077928",
                :human_address=>"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}
            }
    end

    it "exists" do
        facility_factory = FacilityFactory.new
        expect(facility_factory).to be_an_instance_of(FacilityFactory)
    end

    it "can make a oregon office" do
        facility_factory = FacilityFactory.new
        facility = facility_factory.create_or_facility(oregon)
        expect(facility.name).to eq("Albany DMV Office")
        expect(facility.address).to eq("2242 Santiam Hwy SE, Albany, OR 97321")
        expect(facility.phone).to eq("541-967-2014")
    end

    it "can reformat address" do
        raw_address = {:latitude=>"44.632897", :longitude=>"-123.077928",
           :human_address=>"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}
        expect(FacilityFactory.new.parse_or_address(raw_address)).to eq("2242 Santiam Hwy SE, Albany, OR 97321")
    end

    # it "can make a ny office" do
    #     facility_factory = FacilityFactory.new
    #     facility = facility_factory.create_ny_facility(newyork)
    #     expect(facility.name).to eq()
    #     expect(facility.address).to eq()
    #     expect(facility.phone).to eq()
    # end

end

    # ran out of time to really rework this - my new york test needed to be finished and continue on to MO
    # MO test and method would look similar to what I have just parse the data a bit different.
    # If I had more time I would re-work my entire FacilityFactory class using .map instead of how I have it now. 
    # then have it format the data (name, address, phone, etc.)