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
      facility[:hours] = change_to_hours_key(facility)
      facility[:holidays_closed] = change_to_holidays_key(facility)
      @facilities << Facility.new(facility)
    end
  end

  def change_to_address_key(facility_info)
    if facility_info.has_key?(:address_li)
      [facility_info[:address_li], ' ', facility_info[:address__1], ' ', facility_info[:city], ', ', facility_info[:state], ' ', facility_info[:zip]].join
    elsif facility_info.has_key?(:street_address_line_1)
      [facility_info[:street_address_line_1], ' ', facility_info[:city], ', ', facility_info[:state], ' ', facility_info[:zip_code]].join
    elsif facility_info.has_key?(:address1)
      [facility_info[:address1], ' ', facility_info[:city], ', ', facility_info[:state], ' ', facility_info[:zipcode]].join
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

  def change_to_hours_key(facility_info)
    if facility_info.has_key?(:hours)
      facility_info[:hours]
    elsif facility_info.has_key?(:monday_beginning_hours)
      "Monday: #{facility_info[:monday_beginning_hours]} - #{facility_info[:monday_ending_hours]}
      Tuesday: #{facility_info[:tuesday_beginning_hours]} - #{facility_info[:tuesday_ending_hours]}
      Wednesday: #{facility_info[:wednesday_beginning_hours]} - #{facility_info[:wednesday_ending_hours]}
      Thursday: #{facility_info[:thursday_beginning_hours]} - #{facility_info[:thursday_ending_hours]}
      Friday: #{facility_info[:friday_beginning_hours]} - #{facility_info[:friday_ending_hours]}".delete("\n")
    elsif facility_info.has_key?(:daysopen)
      facility_info[:daysopen]
    else
      'Hours unavailable.'
    end
  end

  def change_to_holidays_key(facility_info)
    if facility_info.has_key?(:holidaysclosed)
      facility_info[:holidaysclosed]
    else
      'Holiday schedule unavailable.'
    end
  end
end