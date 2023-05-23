
class FacilityHandler
  def state_sorter
    dmv_locations[1][:state].include?("MO")
    dmv_locations[1][:website].include?('oregon')
    dmv_locations[1][:state].include?("NY")
  end

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
    phone: data[public_phone_number],
    address: )
    end
  end

  def address_formatter_oregon(data)
    address = JSON.parse(data[:location_1][:human_address])
    address.values.join(", ")
  end
  def address_formatter_missouri(data)
    address = "#{data[:address1]}, #{data[:city]}, #{data[:state]}, #{data[:zipcode]}"
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