
class FacilityHandler
  def state_sorter(dmv_locations)
    if dmv_locations[1][:state].include?("MO")
      create_missouri_facilities(dmv_locations)
    elsif dmv_locations[1][:state].include?("NY")
      create_new_york_facilities(dmv_locations)
    else dmv_locations[1][:website].include?('oregon')
      create_oregon_facilities(dmv_locations)
    end
  end
  #this method will sort through each JSON file to confirm which state the facility builder should do


  def create_oregon_facilities(dmv_locations)
      oregon_facility = dmv_locations.map do |data|
        Facility.new(name:  data[:title],
        phone: data[:phone_number], 
        address: address_formatter_oregon(data))
      end
  end
  def create_missouri_facilities(dmv_locations)
      missiouri_facility = dmv_locations.map do |data|
        Facility.new(name: data[:name],
        phone: data[:phone],
        address: address_formatter_missouri(data))
      end
  end

  def create_new_york_facilities(dmv_locations)
    new_york_facility = dmv_locations.map do |data|
      Facility.new(name: data[:office_name], 
    phone: data[:public_phone_number],
    address:address_formatter_new_york(data))
    end
  end
#each of the create_state_facilities runs a specific method for each state to parse the information
  def address_formatter_oregon(data)
    address = JSON.parse(data[:location_1][:human_address])
    address.values.join(", ")
  end

  def address_formatter_missouri(data)
    address = "#{data[:address1]}, #{data[:city]}, #{data[:state]}, #{data[:zipcode]}"
  end

  def address_formatter_new_york(data)
    address = "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]}, #{data[:zip_code]}"
  end
end

#The address_formatter_state methods essemble the address from each database into a more readable format



#The code below is drafted code based on trying to do the create_state_facilities in one large method
#This idea was abandoned in favor of doing individual methods for each state and then doing a sorter

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