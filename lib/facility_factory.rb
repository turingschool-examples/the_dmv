class FacilityFactory

  def create_facilities(facility_data)
    facility_data.map do |facility|
      Facility.new({
        name: facility[:title],
        address: format_address(facility),
        phone: facility[:phone_number]
      })
    end
  end

  def format_address(facility)
    # OREGON DMV
    if facility[:location_2]
      address = JSON.parse(facility[:location_1][:human_address])
      suite_number = JSON.parse(facility[:location_2][:human_address])      
      "#{address[:address]} #{suite_number[:address]} #{address[:city]} #{address[:state]} #{address[:zip]}"
    else
      address = JSON.parse(facility[:location_1][:human_address])
      "#{address[:address]} #{address[:city]} #{address[:state]} #{address[:zip]}"
    end
  end


end