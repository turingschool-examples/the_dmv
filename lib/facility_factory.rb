require './lib/facility'
require './lib/dmv_data_service'

class FacilityFactory

  def create_facility(facility_api_data) 
    facilities = [] 
  
    facility_api_data.each do |data| 
      if data[:state] == "CO"
        new_facility = Facility.new({ 
          name: data[:dmv_office],
          phone: data[:phone],
          address: "#{data[:address_li]}, #{data[:address__1]}#{data[:city]} #{data[:state]}, #{data[:zip]}"
        })
      facilities << new_facility

      elsif data[:state] == "NY"
        new_facility = Facility.new({ 
          name: data[:"office_name"],
          phone: data[:public_phone_number] ||= "N/A",
          address: "#{data[:street_address_line_1]}, #{data[:city]} #{data[:state]}, #{data[:zip_code]}"
        })
      facilities << new_facility
    end
    facilities
  end
end