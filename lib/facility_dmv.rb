class FacilityDmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        name: facility[:title],
        zip_code: facility[:zip_code],
        website: facility[:website],
        type: facility[:type],
        phone: facility[:phone_number],
        agency: facility[:agency],
        address: address_converter(facility[:location_1][:human_address])
        
        # add_hash = facility[:location_1][:human_address]
        # string_hash = JSON.parse(add_hash)
        # string_hash.values.join(' ')
      }
       
        @facilities << Facility.new(facility_hash)
        # require 'pry'; binding.pry
    end
  end
  def address_converter(api_info)
        add_hash = (api_info)
        string_hash = JSON.parse(add_hash)
        string_hash.values.join(' ')
  end
end