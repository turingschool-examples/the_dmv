class FacilityFactory
              
  def initialize
  end

  def create_facility(facility_list)
    facility_list.map do |facility_data|
      Facility.new(facility_data)
    end
  end

  def oregon_transform(original_dataset)
    original_dataset.find_all do |original_datum|
      original_datum[:name] = original_datum.delete :title
      original_datum[:address] = original_datum.delete :location_1
      original_datum[:phone] = original_datum.delete :phone_number
    end
    original_datum[:address]
  end
      

    # human_address = or_dmv_office_locations[1][:location_1][:human_address]
    # human_address.delete("{").delete("}")
    # human_address.join("")
    # human_address.delete("address").delete("city").delete("state").delete("zip")
    # human_address 
  

  # def rename_vehicles(vehicle_list)
  #   vehicle_list.find_all do |vehicle_data|
  #     vehicle_data[:vin] = vehicle_data.delete :dol_vehicle_id
  #     vehicle_data[:year] = vehicle_data.delete :model_year
  #     vehicle_data[:engine] = :ev
  #   end
  # end

  # @name = facility_info[:name]
  # @address = facility_info[:address]
  # @phone = facility_info[:phone]


  # def new_york_tranform

  # end

  # def missouri_transform

  # end

#   or_dmv_office_locations[1][:location_1][:human_address]
#   {name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' }

#  or_facility_data = {:title=>"Ashland DMV Office",
#  :zip_code=>"97520",
#  :website=>"http://www.oregon.gov/ODOT/DMV/pages/offices/ashland.aspx",
#  :type=>"DMV Location",
#  :phone_number=>"541-776-6092",
#  :agency=>"Transportation, Department of ",
#  :location_1=>
#   {:latitude=>"42.184549",
#    :longitude=>"-122.671018",
#    :human_address=>"{\"address\": \"600 Tolman Creek Rd\", \"city\": \"Ashland\", \"state\": \"OR\", \"zip\": \"97520\"}"}}


# ny_facility_data = {:office_name=>"SELDEN",
# :office_type=>"MOBILE OFFICE",
# :street_address_line_1=>"407 SELDEN RD",
# :city=>"SELDEN",
# :state=>"NY",
# :zip_code=>"11784",
# :monday_beginning_hours=>"8:00 AM",
# :monday_ending_hours=>"6:00 PM",
# :tuesday_beginning_hours=>"8:00 AM",
# :tuesday_ending_hours=>"6:00 PM",
# :wednesday_beginning_hours=>"8:00 AM",
# :wednesday_ending_hours=>"6:00 PM",
# :thursday_beginning_hours=>"8:00 AM",
# :thursday_ending_hours=>"6:00 PM",
# :friday_beginning_hours=>"8:00 AM",
# :friday_ending_hours=>"6:00 PM"}



# mo_facility_data = {:number=>"166",
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
# :officemanager=>"Rita Lahr",
# :daysopen=>"Monday-Friday - 9:00 to 5:00, Last Saturday  - 9:00 to 12:00",
# :holidaysclosed=>
#  "Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), President’s Day (02/20/23), Memorial Day (05/29/23), Juneteenth (06/19/2023), Independence Day (07/04/23), Labor Day (09/04/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)",
# :additionaldaysclosed=>
#  "7/2/22,     9/3/22,     11/25/22,     11/26/22,     11/28/2022 (at 11:45 AM),     12/22/2022 (at 1:30 PM ),     12/31/22,    1/25/2023 (at 9:00 AM until 11:00 AM ),    1/25/2023 (open at 11:00 AM ),   1/30/2023 (at 9:00 AM until 10:00 AM ),   1/30/2023 (open at 10:00 AM ),  2/22/2023 (at 3:00 PM ),     5/27/23,     9/2/23,     11/24/23,     11/25/23,     12/30/23",
# :latlng=>{:latitude=>"38.4981572", :longitude=>"-90.3001675"},
# :facebook_url=>"https://m.facebook.com/people/Oakville-License-Office/100069096876261/",
# :textingphonenumber=>"(314) 730-0606",
# :othercontactinfo=>"Public Email: oakville@yorkmanagementgroup.com",
# :":@computed_region_ny2h_ckbz"=>"248",
# :":@computed_region_c8ar_jsdj"=>"51",
# :":@computed_region_ikxf_gfzr"=>"2210"}
  

  
end