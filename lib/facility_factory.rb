class FacilityFactory
  def initialize
  end

  def create_facilities(facility_data)
    facility_details_array = [] #creates the Oregon facilities hashes
    facility_data.each do |facility|
      facility_details = {
        name: facility[:title],
        phone: facility[:phone_number],
        address: format_address(facility[:location_1][:human_address])
      }
      facility_details_array << facility_details
    end

    #creates the new facilities with standardized data
    facilities = facility_details_array.map do |facility_details|
      Facility.new(facility_details)
    end
  end

  def format_address(address_data)  #formats the Oregon address data
    address_data.delete('{}\"').split(', ').map { |address| address.split(': ')[1] }.join(" ")
  end
end
