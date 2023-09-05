class FacilityFactory
  def create_facilities(data)
    if data == DmvDataService.new.co_dmv_office_locations
      data.map do |facility_data|
      address = "#{facility_data[:address_li]}, #{facility_data[:address__1]}, #{facility_data[:city]}, #{facility_data[:state]} #{facility_data[:zip]}"
      facility = Facility.new({name: facility_data[:dmv_office],
        address: address,
        phone: facility_data[:phone]})
      end 
    elsif data == DmvDataService.new.ny_dmv_office_locations
      data.map do |facility_data|
      address = "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zip_code]}"
      facility = Facility.new({name: facility_data[:office_name],
        address: address,
        phone: facility_data[:public_phone_number]})
      end 
    elsif data == DmvDataService.new.mo_dmv_office_locations
      data.map do |facility_data|
      address = "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]}, #{facility_data[:zipcode]}"
      facility = Facility.new({name: facility_data[:name],
        address: address,
        phone: facility_data[:phone]})
      end 
    end 
  end
end


