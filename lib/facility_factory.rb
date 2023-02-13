require './lib/facility'
require 'json'

class FacilityFactory
  def create_facilities(facilities_data, state)
    case state
      when :OR then create_oregon_facilities(facilities_data)
      when :NY then create_new_york_facilities(facilities_data)
    end
  end

  def create_oregon_facilities(facilities_data)
    facilities_data.map do |facility|
      address = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)

      Facility.new({
        name: facility[:title],
        address: "#{address[:address]} #{address[:city]} #{address[:state]} #{address[:zip]}",
        phone: facility[:phone_number]
      })
    end
  end

  def create_new_york_facilities(facilities_data)
    facilities_data.map do |facility|
      Facility.new({
        name: facility[:office_name],
        address: "#{facility[:street_address_line_1]} "\
        "#{facility[:street_address_line_2] ?
           facility[:street_address_line_2] + ' ' : ''}"\
        "#{facility[:city]} #{facility[:state]} #{facility[:zip_code]}",
        phone: facility[:public_phone_number]
      })
    end
  end
end
