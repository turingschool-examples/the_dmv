require_relative 'facility'

class DmvFactory

  def create_facilities(data)
    if data[0][:state] == "CO"
      return scrape_co_data(data)
    end
  end

  def build_address(line_1, line_2, city, state, zip)
    address_arr = [line_1, line_2, city , state, zip]
    address = address_arr.join(" ")
  end

  def scrape_co_data(data)
    facilities_array = []
    data.each do |facility|
      facility_details = {
        name: facility[:dmv_office],
        address: build_address(facility[:address_li], facility[:address__1], facility[:city], facility[:state], facility[:zip]), 
        phone: facility[:phone]
      }
      facilities_array << Facility.new(facility_details)
    end
    facilities_array
  end

end