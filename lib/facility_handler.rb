
class Facility_handler
  # def create_facilities(dmv_locations)
  #   facility_data_sorter(dmv_locations)
  #   new_facility = dmv_locations.map do |location|
  #     Facility.new
      
  #   end 
  # end
  def create_facilities(dmv_locations)
    if dmv_locations[1][:website].include?('oregon')
      @oregon_facilities = dmv_locations.map do |data|
        Facility.new(name:  data[:title],
        phone: data[:phone_number], 
        address: address_formatter(data[:location_1][:human_address]))
        
      
      end
      require 'pry'; binding.pry
    end
    if dmv_locations
  end
  def address_formatter(data)
      address = JSON.parse(data[:location_1][:human_address])
      "#{address[:address]}, #{address[:city]}, #{address[:state]}, #{address[:zip]}"
  end

  def phone_editor

  end
end
#   def name_sorter(data)
#     if data[:website].include?('oregon')
#       data[:title]
#     #elsif data[:state].include?('NY')66
#     end
#   end
# end
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