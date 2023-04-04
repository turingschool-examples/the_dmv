require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_factory'

RSpec.describe FacilityFactory do
  before(:each) do
    @facility_factory = FacilityFactory.new
    @oregon = DmvDataService.new.or_dmv_office_locations
    @new_york = DmvDataService.new.ny_dmv_office_locations
    @missouri = DmvDataService.new.mo_dmv_office_locations
  
  end

  describe "#Facility Factory" do
    it "exists" do 
      expect(@facility_factory).to be_a(FacilityFactory)
      require 'pry'; binding.pry
    end

  end

end

# OREGON
  # title=>"Albany DMV Office",
  # :zip_code=>"97321",
  # :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/albany.aspx",
  # :type=>"DMV Location",
  # :phone_number=>"541-967-2014",
  # :agency=>"Transportation, Department of ",
  # :location_1=>
  #  {:latitude=>"44.632897", :longitude=>"-123.077928", :human_address=>"{\"address\": \"2242 Santiam Hwy SE\", \"city\": \"Albany\", \"state\": \"OR\", \"zip\": \"97321\"}"}},

# NEW YORK
#   office_name=>"SELDEN",
#   :office_type=>"MOBILE OFFICE",
#   :street_address_line_1=>"407 SELDEN RD",
#   :city=>"SELDEN",
#   :state=>"NY",
#   :zip_code=>"11784",
#   

#MISSOURI
  # number=>"166",
  # :dorregionnumber=>"8",
  # :type=>"1MV",
  # :name=>"OAKVILLE",
  # :address1=>"3164 TELEGRAPH ROAD",
  # :city=>"ST LOUIS",
  # :state=>"MO",
  # :zipcode=>"63125",
  # :county=>"St. Louis County",
  # :phone=>"(314) 887-1050",
  # :fax=>"(314) 887-1051",
  # :size=>"3",
  # :email=>"OAKVILLEAGENTOFFICE@DOR.MO.GOV",
  # :agent=>"York Management Group, LLC.",  