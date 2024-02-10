class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facility(data_service)
    data_service.each do |facility|
      facility[:name] = change_to_name_key(facility)
      facility[:address] = change_to_address_key(facility)
      facility[:phone] = change_to_phone_key(facility)
      @facilities << Facility.new(facility)
    end
  end

  def change_to_address_key(facility_info)
    if facility_info.has_key?(:address_li)
      facility_info[:address_li]
    elsif facility_info.has_key?(:street_address_line_1)
      facility_info[:street_address_line_1]
    elsif facility_info.has_key?(:address1)
      facility_info[:address1]
    end
  end

  def change_to_name_key(facility_info)
    if facility_info.has_key?(:dmv_office)
      facility_info[:dmv_office]
    elsif facility_info.has_key?(:office_name)
      facility_info[:office_name]
    else
      "#{facility_info[:city]}, #{facility_info[:state]} DMV"
    end
  end

  def change_to_phone_key(facility_info)
    if facility_info.has_key?(:phone)
      facility_info[:phone]
    elsif facility_info.has_key?(:public_phone_number)
      facility_info[:public_phone_number]
    else
      'No number available.'
    end
  end
end