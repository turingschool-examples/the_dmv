class Dmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def format_address(dmv_site)
    if dmv_site[:address__1].nil?
      dmv_site[:address_li] + " " + dmv_site[:city] + " " + dmv_site[:state] + " " + dmv_site[:zip]
    else 
      dmv_site[:address_li] + " " + dmv_site[:address__1] + " " + dmv_site[:city] + " " + dmv_site[:state] + " " + dmv_site[:zip]
    end
  end

  def create_facilities(dmv_location_data)
    #go into the dmv_location_data array
    #with each dmv_site element (hash of location info)
    #reassign the various key/value pairs
    #create a new facility object with that data as the parameter)
    dmv_location_data.map do |dmv_site|
      dmv_facility_details = {
          name: dmv_site[:dmv_office], 
          address: format_address(dmv_site),
          phone: dmv_site[:phone]
          # services: ... not sure how I can transfer in this data since the terms don't match exactly. Also is it needed?
        }

      Facility.new(dmv_facility_details)
    end
  end
end

# [{:the_geom=>{:type=>"Point", :coordinates=>[-104.97443112500002, 39.75525297420336]},
#   :dmv_id=>"1",
#   :dmv_office=>"DMV Tremont Branch",
#   :address_li=>"2855 Tremont Place",
#   :address__1=>"Suite 118",
#   :city=>"Denver",
#   :state=>"CO",
#   :zip=>"80205",
#   :phone=>"(720) 865-4600",
#   :hours=>"Mon, Tue, Thur, Fri  8:00 a.m.- 4:30 p.m. / Wed 8:30 a.m.-4:30 p.m.",
#   :services_p=>"vehicle titles, registration, renewals;  VIN inspections",
#   :parking_no=>"parking available in the lot at the back of the bldg (Glenarm Street)",
#   :photo=>"images/Tremont.jpg",
#   :address_id=>"175164",
#   :":@computed_region_nku6_53ud"=>"1444"},