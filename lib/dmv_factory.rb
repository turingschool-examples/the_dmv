require_relative 'facility'

class DmvFactory

  def create_facilities(data)
    facilities_array = []
    data.each do |facility|
      facility_details = {
        name: facility[:dmv_office],
        address: build_address(facility),
        phone: facility[:phone]
      }
      facilities_array << Facility.new(facility_details)
    end
    facilities_array

  end

  def build_address(facility)
    address_arr = [facility[:address_li], facility[:address__1], 
                   facility[:city], facility[:state], facility[:zip]]
    address = address_arr.join(" ")
  end
end