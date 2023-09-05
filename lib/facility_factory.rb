class FacilityFactory
  attr_reader :locations_co, :locations_mo, :locations_ny

  def initialize
    @locations_co = []
    @locations_mo = []
    @locations_ny = []
  end

  def create_locations(data)
    data.each do |facility_data|
      if facility_data[:state] == "CO"
        new_facility = Facility.new(
          name: facility_data[:dmv_office],
          address: "#{facility_data[:address_li]} #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip]}",
          phone: facility_data[:phone]
        )
        new_facility.services << facility_data[:services_p]
        @locations_co << new_facility
        
      elsif facility_data[:state] == "NY"
       ny_facility = Facility.new(
          name: facility_data[:office_name],
          address: ny_address(facility_data),
          phone: ny_phone_number(facility_data[:public_phone_number])
        )
        @locations_ny << ny_facility

      elsif facility_data[:state] == "MO"
        mo_facility = Facility.new(
          name: facility_data[:name],
          address: "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zipcode]}",
          phone: facility_data[:phone]
        )
        @locations_mo << mo_facility
      else
        return "Apologies, we don't offer services for this state."
      end
    end
  end

  def ny_phone_number(phone)
    return nil if phone.nil?
    phone.insert(0, "(").insert(4, ")").insert(5, " ").insert(9,"-")
  end

  def ny_address(facility_data)
    address = "#{facility_data[:street_address_line_1]}, "
    address += "#{facility_data[:street_address_line_2]} #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip_code]}".strip
  end
end

