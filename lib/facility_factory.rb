class FacilityFactory
  def initialize
    
  end

  def create_facility(dmv)
    dmv.map do |facility|
      Facility.new(
        {name: facility[:title] || facility[:office_name] || facility[:name] || nil,
        address: facility[:address1]  || facility[:street_address_line_1] || facility[:location_1][:human_address] || nil,
        phone: facility[:phone_number] || facility[:public_phone_number] || facility[:phone] || nil,   
        zipcode: facility[:zip_code] || facility[:zipcode],
        open_hour: facility[:monday_beginning_hours] || nil,
        closing_hour: facility[:friday_ending_hours] || nil
        })
    end
  end
end