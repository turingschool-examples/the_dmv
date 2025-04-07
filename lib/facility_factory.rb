class FacilityFactory
  def initialize
  end

  def create_factories(location, facility_data)
    facility_data.map do |data|
      if location == "Colorado"
      facility = Facility.new({
        name: data[:dmv_office],
        address: data[:address_li],
        phone: data[:phone]
      })
      elsif location == "New York"
        facility = Facility.new({
        name: data[:office_name],
        address: data[:street_address_line_1],
        phone: data[:public_phone_number]
      })
      elsif location == "Missouri"
        facility = Facility.new({
        name: data[:name],
        address: data[:address1],
        phone: data[:phone]
      })
      end 
    end 
  end
end
