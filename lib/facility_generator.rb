class FacilityGenerator
  def create_facility(facility)
    facility.map do |data|
      if data[:state] == "CO"
        co_facility(data)
      elsif data[:state] == "NY"
        ny_facility(data)
      elsif data[:state] == "MO"
        mo_facility(data)
      end
    end
  end
     #compress everything into chunks(methods) to make it easier to read.
  def co_facility(data)
    facility_co = {
        name: data[:dmv_office],
        address: "#{data[:address_li]}, #{data[:address__1]}, #{data[:city]}, #{data[:state]} #{data[:zip]}",
        phone: data[:phone],
        hours: data[:hours],
        services: data[:services_p]
    }
    Facility.new(facility_co)
  end

  def ny_facility(data)
    facility_ny = {
        name: data[:office_name],
        address: "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}",
        phone: data[:public_phone_number],
        hours: "Monday - Friday: #{data[:monday_beginning_hours]} - #{data[:monday_ending_hours]}"
    }
    Facility.new(facility_ny)
  end

  def mo_facility(data)
    facility_mo = {
        name: data[:name],
        address: "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}",
        phone: data[:phone],
        hours: data[:daysopen],
        services: data[:services]
    }
    Facility.new(facility_mo)
  end
end