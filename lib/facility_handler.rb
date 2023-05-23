class Facility_handler
  def create_facilities(dmv_locations)
    facility_data_sorter(dmv_locations)
    dmv_locations.map do |location|
  end
  def facility_data_sorter(dmv_locations)
    if dmv_locations ==  @or_dmv_office_locations
      dmv_locations.each do |data|
        data[:name] = data[:title]
        data[:phone] = data[:phone_number]
        data[:address] = data[:location_1][:human_address]
      end
    # elsif  dmv_locations = mo_dmv_office_locations
    #   dmv_locations.each do |data|
    #     data[:name] = data[:office_name]
    #     data[:phone] = data[:public_phone_number]
    #     data[:address] = data[:street_address_line]
    #   end
    # else 
    #   dmv_locations.each do |data|
    #     data[:address] = data[:address1][:city][:state][:zipcode].to_s.join
    end
    

  end
end