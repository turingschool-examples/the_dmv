class FacilityFactory

  def create_facilities(facility_data)
    facility_data.map do |facility|
      Facility.new({
        name:    format_name(facility),
        address: format_address(facility),
        phone:   format_phone(facility)
      })
    end
  end

  def format_name(facility)
    if facility[:website] && facility[:website].include?("oregon.gov")
      facility[:title]
    elsif facility[:state] == "NY"                  
      facility[:office_name]
    elsif facility[:state] == "MO"
      facility[:name]
    end
  end

  def format_address(facility)
    if facility[:website] && facility[:website].include?("oregon.gov")
      if facility[:location_2]
        address = JSON.parse(facility[:location_1][:human_address])
        suite_number = JSON.parse(facility[:location_2][:human_address])      
        "#{address[:address]} #{suite_number[:address]} #{address[:city]} #{address[:state]} #{address[:zip]}"
      else
        address = JSON.parse(facility[:location_1][:human_address])
        "#{address[:address]} #{address[:city]} #{address[:state]} #{address[:zip]}"
      end
    elsif facility[:state] == "NY"
      if facility[:street_address_line_2]
        "#{facility[:street_address_line_1]} #{facility[:street_address_line_2]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
      else
        "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
      end
    elsif facility[:state] == "MO"
      "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}"
    end
  end

  def format_phone(facility)
    if facility[:state] == "NY" && facility[:public_phone_number]
      phone = facility[:public_phone_number]
      "(#{phone[0..2]}) #{phone[3..5]}-#{phone[6..9]}"
    elsif facility[:website] && facility[:website].include?("oregon.gov")
      phone = facility[:phone_number]
      "(#{phone[0..2]}) #{phone[4..6]}-#{phone[8..11]}"
    elsif facility[:state] == "MO"
      facility[:phone]
    else
      ""
    end
  end

end