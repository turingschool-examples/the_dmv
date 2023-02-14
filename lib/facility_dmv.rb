class FacilityDmv
  attr_reader :or_facilities,
              :ny_facilities,
              :mo_facilities


  def initialize
    @or_facilities = []
    @ny_facilities = []
    @mo_facilities = []
  end

  def create_or_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        name: facility[:title], 
        address: ny_address_converter(facility[:location_1][:human_address]),
        phone: facility[:phone_number] 
      }
      @or_facilities << Facility.new(facility_hash)
    end
  end

  def ny_address_converter(hash_in_string)
    JSON.parse(hash_in_string).values.join(' ')
  end

  def ny_phone_converter(number_string)
    if number_string != nil
      number_string.insert(3, '-').insert(-5, '-')
    else 
      ""
    end
  end

  def create_ny_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        name: facility[:office_name],
        phone: ny_phone_converter(facility[:public_phone_number]),
        address: "#{facility[:street_address_line_1]}, #{facility[:city]} #{facility[:state]}, #{facility[:zip_code]}" 
      }
      @ny_facilities << Facility.new(facility_hash)
    end
  end

  def mo_phone_converter(number_string)
    if number_string != nil
      number_string.gsub(' ', '-')
    else
      ""
    end
  end

  def create_mo_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        name: facility[:name].rstrip,
        phone: mo_phone_converter(facility[:phone]),
        address: "#{facility[:address1]}, #{facility[:city].rstrip}, #{facility[:state]} #{facility[:zipcode]}"
      }
      @mo_facilities << Facility.new(facility_hash)
    end
  end
end