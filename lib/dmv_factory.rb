require_relative 'facility'

class DmvFactory

  def create_facilities(data)
    if data[0][:state] == "CO"
      return scrape_co_data(data)
    elsif data[0][:state] == "NY"
      return scrape_ny_data(data)
    elsif data[0][:state] == "MO"
      return scrape_mo_data(data)
    end
  end

  # build_address is ment to help take the multiple address lines that come in as data
  # and join them all together into 1 address value. currently it's not saving any lines
  # though tryiing to make it work for multiple data sources. may be useful to make
  # code more readable
  # def build_address(address_info)
  #   address_arr = [line_1, line_2, city , state, zip]
  #   address = address_arr.join(" ")
  # end

  def scrape_co_data(data)
    facilities_array = []
    data.each do |facility|
      facility_details = {
        name: facility[:dmv_office],
        address: [facility[:address_li], facility[:address__1], facility[:city], facility[:state], facility[:zip]].join(' '), 
        phone: facility[:phone],
        hours: facility[:hours]
      }
      facilities_array << Facility.new(facility_details)
    end
    facilities_array
  end

  def scrape_ny_data(data)
    facilities_array = []
    data.each do |facility|
      facility_hours = {
        "Monday:" => "#{facility[:monday_beginning_hours]} - #{facility[:monday_ending_hours]}",
        "Tuesday:" => "#{facility[:tuesday_beginning_hours]} - #{facility[:tuesday_ending_hours]}",
        "Wednesday:" => "#{facility[:wednesday_beginning_hours]} - #{facility[:wednesday_ending_hours]}",
        "Thursday:" => "#{facility[:thursday_beginning_hours]} - #{facility[:thursday_ending_hours]}",
        "Friday:" => "#{facility[:friday_beginning_hours]} - #{facility[:friday_ending_hours]}"
        
      }
      facility_details = {
        name: facility[:office_name],
        address: [facility[:street_address_line_1], facility[:city], facility[:state], facility[:zip_code]].join(' '), 
        phone: facility[:phone],
        hours: facility_hours
      }
      facilities_array << Facility.new(facility_details)
    end
    require 'pry';binding.pry
    facilities_array
  end

  def scrape_mo_data(data)
    facilities_array = []
    data.each do |facility|
      facility_details = {
        name: facility[:name],
        address: [facility[:address1], facility[:city], facility[:state], facility[:zipcode]].join(' '), 
        phone: facility[:phone]
      }
      facilities_array << Facility.new(facility_details)
    end
    facilities_array
  end

end