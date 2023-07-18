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
      elsif valid_mo_address(location)
        new_facility = Facility.new({
          name: location[:name],
          address: 
          "#{location[:address1]} "\
          "#{location[:city]}, "\
          "#{location[:state]} "\
          "#{location[:zipcode]}",
          phone: location[:phone]
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

  def valid_mo_address(location)
    location.keys.include?(:address1) &&
    location.keys.include?(:city) &&
    location.keys.include?(:state) &&
    location.keys.include?(:zipcode)
  end

  def name_and_address_filter(data)
    units_of_data = data.split
    units_of_data.map {|unit| unit.capitalize}.join(" ")
  end

  def phone_filter(data)
    if data.length < 14 && !data.include?("(") && !data.include?(")") && !data.include?(" ") && !data.include?("-")
      data.insert(0, "(")
      data.insert(4, ")")
      data.insert(5, " ")
      data.insert(9, "-")
    else
      data = data
    end
  end
end