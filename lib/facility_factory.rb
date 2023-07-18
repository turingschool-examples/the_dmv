require './lib/facility'
require './lib/dmv_data_service'

class FacilityFactory

  def create_facility(facility_api_data) 
    facilities = [] 
  
    facility_api_data.each do |data| 
      new_facility = Facility.new({ 
        name: data[:dmv_office],
        phone: data[:phone],
        address: "#{data[:address_li]}, #{data[:address__1]}#{data[:city]} #{data[:state]}, #{data[:zip]}"
      })
      facilities << new_facility
    end
    facilities
  end
end