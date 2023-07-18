require 'facility'
require 'dmv_data_service'

class FacilityFactory

  def create_facilities(api_database)
    facilities =[]

    api_database.each do |location|
      if location[:state] == "CO"
        new_facility = Facility.new({
          name: location[:dmv_office],
          address: "#{location[:address_li]}, #{location[:address__1]}, #{location[:city]}, #{location[:state]}, #{location[:zip]} ",
          phone: location[:phone]
        })
      facilities << new_facility

      elsif location[:state] == "NY"
        new_facility = Facility.new({
        name: location[:office_name],
        address: "#{location[:street_address_line_1]}, #{location[:city]}, #{location[:state]}, #{location[:zip_code]} ",
        phone: location[:public_phone_number] ||= '0000000000'
      })
      facilities << new_facility

      elsif location[:state] == "MO"
        new_facility = Facility.new({
        name: location[:name],
        address: "#{location[:address1]}, #{location[:city]}, #{location[:state]}, #{location[:zipcode]} ",
        phone: location[:public_phone_number] ||= '0000000000'
      })
    facilities << new_facility


    end

    end
    facilities
  end
end
