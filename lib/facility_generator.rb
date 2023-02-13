require './lib/facility'

class FacilityGenerator
  def create_facility(facility_info)
    facility_info.map do |info|
      Facility.new(
        address: info[:location_1],
        collected_fees: info[:collected_fees],
        name: info[:title],
        phone: info[:phone_number],
        register_vehicles: info[:register_vehicles],
        services: info[:services]
      ) 
    end
  end
end
