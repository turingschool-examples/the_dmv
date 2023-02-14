class FacilityDmv
  attr_reader :or_facilities

  def initialize
    @or_facilities = []
  end

  def create_or_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        name: facility[:title],
        zip_code: facility[:zip_code],
        website: facility[:website],
        type: facility[:type],
        phone: facility[:phone_number],
        agency: facility[:agency],
        address: address_converter(facility[:location_1][:human_address])
      
      }
       
        @or_facilities << Facility.new(facility_hash)
    end
  end
  def address_converter(api_info)
        hash_in_string = (api_info)
        add_hash = JSON.parse(hash_in_string)
        add_hash.values.join(' ')
  end
end