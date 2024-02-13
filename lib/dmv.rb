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
    elsif dmv_site.has_key?(:address1)
      dmv_site[:address1] + " " + dmv_site[:city] + " " + dmv_site[:state] + " " + dmv_site[:zipcode]
    end
  end

  def format_name(dmv_site)
    if dmv_site.has_key?(:dmv_office)
      dmv_site[:dmv_office]
    elsif dmv_site.has_key?(:office_name)
      dmv_site[:office_name]
    elsif dmv_site.has_key?(:name)
      dmv_site[:name]
    end
  end

  def format_phone(dmv_site)
    if dmv_site.has_key?(:phone)
      dmv_site[:phone]
    elsif dmv_site.has_key?(:public_phone_number)
      dmv_site[:public_phone_number]
    end
  end

  def create_facilities(dmv_location_data)
    dmv_location_data.map do |dmv_site|
      dmv_facility_details = {
        name: format_name(dmv_site),
        address: format_address(dmv_site),
        phone: format_phone(dmv_site)
      }

      Facility.new(dmv_facility_details)
    end
  end
end