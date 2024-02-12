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
    if dmv_site.has_key?(:address_li)
      dmv_site[:address_li] + " " + dmv_site[:address__1].to_s + " " + dmv_site[:city] + " " + dmv_site[:state] + " " + dmv_site[:zip]
    elsif dmv_site.has_key?(:street_address_line_1)
      dmv_site[:street_address_line_1] + " " + dmv_site[:city] + " " + dmv_site[:state] + " " + dmv_site[:zip_code]
    end
  end

  def create_facilities(dmv_location_data)
    dmv_location_data.map do |dmv_site|
      dmv_facility_details = {
          name: dmv_site[:dmv_office] || dmv_site[:office_name], 
          address: format_address(dmv_site),
          phone: dmv_site[:phone] || dmv_site[:public_phone_number]
        }

      Facility.new(dmv_facility_details)
    end
  end
end


# ny_api_data:
# {:office_name=>"IRONDEQUOIT",
#   :office_type=>"COUNTY OFFICE",
#   :public_phone_number=>"5857531604",
#   :street_address_line_1=>"545 TITUS AVENUE",
#   :city=>"ROCHESTER",
#   :state=>"NY",
#   :zip_code=>"14617",
#   :monday_beginning_hours=>"8:30 AM",
#   :monday_ending_hours=>"4:30 PM",
#   :tuesday_beginning_hours=>"8:30 AM",
#   :tuesday_ending_hours=>"4:30 PM",
#   :wednesday_beginning_hours=>"8:30 AM",
#   :wednesday_ending_hours=>"6:30 PM",
#   :thursday_beginning_hours=>"8:30 AM",
#   :thursday_ending_hours=>"4:30 PM",
#   :friday_beginning_hours=>"8:30 AM",
#   :friday_ending_hours=>"4:30 PM",
#   :georeference=>{:type=>"Point", :coordinates=>[-77.601698077, 43.20982583]},
#   :":@computed_region_yamh_8v7k"=>"545",
#   :":@computed_region_wbg7_3whc"=>"1676",
#   :":@computed_region_kjdx_g34t"=>"2093"},