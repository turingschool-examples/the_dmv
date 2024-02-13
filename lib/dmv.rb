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

  # def create_facilities(dmv_location_data)
  #   dmv_location_data.map do |dmv_site|
  #     dmv_facility_details = {
  #       name: dmv_site[:dmv_office],
  #       address: dmv_site[:address_li] + " " + dmv_site[:address__1] + " " #helper method
  #       phone: dmv_site[:phone]
  #       # services
  #     }
  #   end
  # end
end
