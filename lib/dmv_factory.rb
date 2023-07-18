class DmvFactory
  def initialize
  end

  def create_facilities(dmv_facilities_data)
    dmv_facilities = []
    dmv_facilities_data.map do |data|
      if data[:state] = "CO"
        new_facility = Facility.new({
          name: data[:dmv_office],
          address: "#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]}, #{data[:zip]}",
          phone: data[:phone]
        })
      elsif data[:state] = "NY"
        new_facility = Facility.new({
          name: data[:office_name],
          address: "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}",
          phone: data[:public_phone_number]
        })
      elsif data[:state] = "MO"
        new_facility = Facility.new({
          name: data[:name],
          address: "#{data[:address1]}, #{data[:city]}, #{data[:state]}, #{data[:zipcode]}",
          phone: data[:phone]
        })
      end
      dmv_facilities << new_facility
    end
    dmv_facilities
  end
end
