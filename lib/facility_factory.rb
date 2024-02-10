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
    facility_info.each do |key, value|
      if key == :address_li
        value
      elsif key == :street_address_line_1
        value
      end
    end
  end

  def change_to_name_key(facility_info)
    facility_info.each do |key, value|
      if key == :dmv_office
        value
      elsif key == :office_name
        value
      end
    end
  end

  def change_to_phone_key(facility_info)
    facility_info.each do |key, value|
      if key == :phone
        value
      elsif key == :public_phone_number
        value
      end
    end
  end
end