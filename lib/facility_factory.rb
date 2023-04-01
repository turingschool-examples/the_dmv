require './lib/facility'
require 'json'

class FacilityFactory
  def create_facility_oregon(data)
    data.map do |facility|
      address_raw = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
      address_formatted = "#{address_raw[:address]} #{address_raw[:city]} #{address_raw[:state]} #{address_raw[:zip]}"

      Facility.new({
        name: facility[:title],
        address: address_formatted,
        phone: facility[:phone_number]
      })
    end
  end

  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def create_facility_new_york(data)
    data.map do |facility|
      Facility.new({
        name: facility[:office_name],
        address: facility[:street_address_line_1],
        phone: facility[:public_phone_numer]
      })
    end
  end

end
