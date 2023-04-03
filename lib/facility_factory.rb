class FacilityFactory
  def initialize
    
  end

  def create_facility(dmv)
    new_facilities = []
    dmv.each do |facility|
      new_facilities << Facility.new(
        name: facility[:title] || facility[:office_name] || facility[:name] || nil,
        address: facility[:address1]  || facility[:street_address_line_1] || facility[:location_1][:human_address] || nil,
        phone: facility[:phone_number] || facility[:public_phone_number] || facility[:phone] || nil,   
        zipcode: facility[:zip_code] || facility[:zipcode]
      )
    end
    new_facilities 
  end
end