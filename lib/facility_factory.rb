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
      location_1 = JSON.parse(facility[:location_1][:human_address]).values
      location_2 = JSON.parse(facility[:location_2][:human_address]).values
      location_1.insert(1, location_2[0]).join(" ")
    else
      JSON.parse(facility[:location_1][:human_address]).values.join(" ")
    end
  end


end