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
    dmv_location_data.map do |dmv_site|
      dmv_facility_details = {
          name: dmv_site[:dmv_office], 
          address: format_address(dmv_site),
          phone: dmv_site[:phone]
        }

      Facility.new(dmv_facility_details)
    end
  end
end