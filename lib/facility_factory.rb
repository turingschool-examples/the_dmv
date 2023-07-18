class FacilityFactory
  def initialize
  end

  def create_facilities(locations)
    facilities = []
    
    locations.each do |location|
      if valid_co_address(location)
        new_facility = Facility.new({
          name: location[:dmv_office],
          address: 
          "#{location[:address_li]} "\
          "#{location[:address__1]} "\
          "#{location[:city]}, "\
          "#{location[:state]} "\
          "#{location[:zip]}",
          phone: location[:phone]
        })
      elsif valid_ny_address(location)
        new_facility = Facility.new({
          name: location[:office_name],
          address: 
          "#{location[:street_address_line_1]} "\
          "#{location[:city]}, "\
          "#{location[:state]} "\
          "#{location[:zip_code]}",
          phone: location[:public_phone_number]
        })
      end
      facilities << new_facility
    end
    facilities
  end

  def valid_co_address(location)
    location.keys.include?(:address_li) &&
    location.keys.include?(:address__1) &&
    location.keys.include?(:city) &&
    location.keys.include?(:state) &&
    location.keys.include?(:zip)
  end

  def valid_ny_address(location)
    location.keys.include?(:street_address_line_1) &&
    location.keys.include?(:city) &&
    location.keys.include?(:state) &&
    location.keys.include?(:zip_code)
  end
end