
class Facility_handler
  def create_facilities(dmv_locations)
    facility_data_sorter(dmv_locations)
    new_facility = @dmv_key.map do |location|
    require 'pry'; binding.pry
      Facility.new(location)
    end 
  end
  def name_sorter(data)
    
  end
end
  # def facility_data_sorter(dmv_locations)
  #   if dmv_locations[1][:website].include?('oregon')
  #     @dmv_key = dmv_locations.each do |data|
  #       data[:name] = data[:title]
  #       @names << data[:name]
  #       data[:phone] = data[:phone_number]
  #       @phone << data[:phone]
  #       # data[:address] = data[:location_1][:human_address]
  #     end
  #   end
    # elsif  dmv_locations = mo_dmv_office_locations
    #   dmv_locations.each do |data|
    #     data[:name] = data[:office_name]
    #     data[:phone] = data[:public_phone_number]
    #     data[:address] = data[:street_address_line]
    #   end
    # else 
    #   dmv_locations.each do |data|
    #     data[:address] = data[:address1][:city][:state][:zipcode].to_s.join