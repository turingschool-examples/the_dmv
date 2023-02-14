class FacilityDmv
  attr_reader :or_facilities,
              :ny_facilities


  def initialize
    @or_facilities = []
    @ny_facilities = []
  end

  def create_or_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {

        name: facility[:title], 
        address: address_converter(facility[:location_1][:human_address]),
        phone: facility[:phone_number]
      
      }
        @or_facilities << Facility.new(facility_hash)
    end
  end

  def address_converter(api_info)
        hash_in_string = (api_info)
        add_hash = JSON.parse(hash_in_string)
        add_hash.values.join(' ')
  end

  def create_ny_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {

        name: facility[:office_name],
        phone: facility[:public_phone_number].insert(3, '-').insert(-5, '-'),
        address: "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]}, #{facility[:zip_code]}" 

      }
      @ny_facilities << Facility.new(facility_hash)
      
    end
  end
end