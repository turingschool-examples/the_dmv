class FacilityFactory

  def create_facilities(dmv_database)
    dmv_database.map do |facility|
      facility = Facility.new({

            name: facility[:title] || facility[:office_name] || facility[:name] || nil,
         address: facility[:location_1][:human_address] || facility[:street_address_line_1] || facility[0][:address1] || nil,
           phone: facility[:phone_number] || facility[:public_phone_number] || nil
                              })
    end
  end
end

