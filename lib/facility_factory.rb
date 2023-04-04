class FacilityFactory
  def create_facilities(state_raw_data)
    created_facilities = state_raw_data.map do |facility| 
      facility_details = format_facility(facility)
        Facility.new(
          {
            name:         facility_details[:name],
            address:      facility_details[:address],
            phone:        facility_details[:phone]
          }
        )
      end
    created_facilities
  end

  def format_facility(data)
    data = {
        name:         format_name(data),
        address:      format_address(data),
        phone:        format_phone(data)
      }
  end

  def format_name(data)
    if data[:state] == "NY"
      data[:office_name]
    elsif data[:state] == "MO"
      data[:name].rstrip 
    elsif data[:wesbite].include?("ODOT")  
      data[:title]
    end
  end

  def format_address(data)
    if data[:state] == "NY"
      "#{data[:street_address_line_1]}, #{data[:city]}, #{data[:state]} #{data[:zip_code]}"
    elsif data[:state] == "MO"
      "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}"
    elsif data[:wesbite].include?("ODOT")  
      address = JSON.parse(data[:location_][:human_address], {symbolize_names: true})
      "#{data[:address1]}, #{data[:city]}, #{data[:state]} #{data[:zipcode]}"
    end
  end

  def format_phone(data)
    if data[:state] == "NY"
      data[:public_phone_number]
    elsif data[:state] == "MO"
      data[:phone]
    elsif data[:wesbite].include?("ODOT")  
      data[:phone_number]
    end
  end
end

# def facility_location(facilities_raw_data)
#   facilities_raw_data.find do |facility_raw_data|
#     facility_raw_data[:state] == "NY"
#     :NY
#   end
#   facilities_raw_data.find do |facility_raw_data|
#     facility_raw_data[:state] == "OR"
#     :OR
#   end
#   facilities_raw_data.find do |facility_raw_data|
#     facility_raw_data[:state] == "MO"
#     :MO
#   end
# end
### PRevious versions of creat_facility
 ### Future State
    # if facilities_data.any? do |facility_data|
    #   facility_data.has_key?(:address1)
    #   created_facilities = facilities_data.map do |facility_data|
    #     Facility.new(
    #       {
    #         name:         "#{facility_data[:name]} DMV Office",
    #         address:      "#{facility_data[:address1]} #{facility_data[:city]} #{facility_data[:state]}",
    #         phone:        facility_data[:phone]
    #       }
    #     )
    #   end
    # elsif facilities_data.any? do |facility_data|
    #   facility_data.has_key?(:street_address_line_1)
    #   created_facilities = facilities_data.map do |facility_data|
    #     Facility.new(
    #       {
    #         name:         "#{facility_data[:office_name]} DMV Office",
    #         address:      "#{facility_data[:street_address_line_1]} #{facility_data[:city]} #{facility_data[:state]}",
    #         phone:        facility_data[:public_phone_number]
    #       }
    #     )
    #   end
    # end
    # created_facilities
    
  #   created_facilities = facilities_data.map do |facility_data|
  #     ## Not working for MO
  #     # Facility.new(
  #     #   {
  #     #     name:         "#{facility_data[:office_name]} DMV Office" || "#{facility_data[:name]} DMV Office",
  #     #     # address:      "#{facility_data[:street_address_line_1]} #{facility_data[:city]} #{facility_data[:state]}" || "#{facility_data[:address1]} #{facility_data[:city]} #{facility_data[:state]}",
  #     #     addrqess:      facility_data[:address1] || facility_data[:street_address_line_1],
  #     #     # address:      facility_data[:address1] || facility_data[:street_address_line_1] && "#{facility_data[:city]} #{facility_data[:state]}",
  #     #     # address:      facility_data[:address1] || facility_data[:street_address_line_1] + "#{facility_data[:city]}" + ", " + "#{facility_data[:state]}",
  #     #     phone:        facility_data[:public_phone_number] || facility_data[:phone]
  #     #   }
  #     # )
  #     ## Working
  #     Facility.new(
  #       {
  #         name:         facility_data[:office_name] || facility_data[:name],
  #         address:      facility_data[:city],
  #         phone:        facility_data[:public_phone_number] || facility_data[:phone]
  #       }
  #     )
  #   end
  #   created_facilities
    
  #   #   Facility.new(
  #   #     {
  #   #       name:         "#{facility_data[:office_name] DMV Office}" or "#{facility_data[:name]}",
  #   #       address:      "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]}" or "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]}",
  #   #       phone:        "#{facility_data[:public_phone_number]}" or "#{facility_data[:phone]]}"
  #   #     }
  #   #   )
  #   # end
  # end