require './lib/facility'

class FacilityGenerator
  def create_facility_or(facility_info)
    facility_info.map do |info|
      Facility.new(
        address: info[:location_1],
        collected_fees: info[:collected_fees],
        name: info[:title],
        phone: info[:phone_number],
        registered_vehicles: info[:registered_vehicles],
        services: info[:services]
      )
    end
  end

  def create_facility_ny(facility_info)
    facility_info.map do |info|
      Facility.new(
      address: info[:street_address_line_1],
      collected_fees: info[:collected_fees],
      name: info[:office_name],
      phone: info[:public_phone_number],
      registered_vehicles: info[:registered_vehicles],
      services: info[:services]
      )
    end
  end

  def create_facility_mo(facility_info)
    facility_info.map do |info|
      Facility.new(
      address: info[:address1],
      collected_fees: info[:collected_fees],
      name: info[:name],
      phone: info[:phone],
      registered_vehicles: info[:registered_vehicles],
      services: info[:services]
      )
    end
  end
end
