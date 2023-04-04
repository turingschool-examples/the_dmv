require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_factory'

RSpec.describe FacilityFactory do

  let(:oregon) do 
    {:title=>"Albany DMV Office", :zip_code=>"97321", :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx", :type=>"DMV Location", :phone_number=>"541-967-2014", :agency=>"Transportation, Department of ", :location_1=>{:latitude=>"44.632897", :longitude=>"-123.077928", :human_address=>"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}}
  end
  
  let(:new_york) do 
    {}
  end

  it "exists" do
    facility_factory = FacilityFactory.new
    expect(facility_factory).to be_an_instance_of(FacilityFactory)
  end

  it "can make new oregon office" do 
    facility_factory = FacilityFactory.new
    facility = facility_factory.create_or_facility(oregon)
    expect(facility.name).to eq("Albany DMV Office")
    # expect(facility.address).to eq("2242 Santiam Hwy SE, Albany, OR 97321")
    expect(facility.phone).to eq("541-967-2014")
  end

  it "can make a new NY office" do 
    facility_factory = FacilityFactory.new
    facility = facility_factory.create_ny_facility(:new york)
    expect(facility.name).to eq("SELDEN")
    expect(facility.address).to eq("407 SELDEN RD, Selden, NY 11784")
    expect(facility.phone).to eq("541-967-2014")
  end
  
end