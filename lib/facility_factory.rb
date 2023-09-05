class Facility_Factory

  def initialize
  end

  def create_office_locations(locations)
    facilities = locations.map do |facility|
      #CO
      if facility[:dmv_office] != nil
        Facility.new(
          name: facility[:dmv_office],
          address: "#{facility[:address_li]} #{facility[:address_l]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}",
          phone: facility[:phone]
        )
        #NY
      elsif facility[:office_name] != nil
        Facility.new(
          name: facility[:office_name],
          address: "#{facility[:street_address_line_1]} #{facility[:street_address_line_2]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}",
          phone: facility[:public_phone_number]
        )
      else facility[:name] != nil
        Facility.new(
          name: facility[:name],
          address: "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}",
          phone: facility[:phone]
        )
      end
    end
  end
end