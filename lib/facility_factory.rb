class FacilityFactory
  def initialize

  end

  def create_facilities(facilities_data)
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
    
    created_facilities = facilities_data.map do |facility_data|
      ## Not working for MO
      # Facility.new(
      #   {
      #     name:         "#{facility_data[:office_name]} DMV Office" || "#{facility_data[:name]} DMV Office",
      #     # address:      "#{facility_data[:street_address_line_1]} #{facility_data[:city]} #{facility_data[:state]}" || "#{facility_data[:address1]} #{facility_data[:city]} #{facility_data[:state]}",
      #     address:      facility_data[:address1] || facility_data[:street_address_line_1],
      #     # address:      facility_data[:address1] || facility_data[:street_address_line_1] && "#{facility_data[:city]} #{facility_data[:state]}",
      #     # address:      facility_data[:address1] || facility_data[:street_address_line_1] + "#{facility_data[:city]}" + ", " + "#{facility_data[:state]}",
      #     phone:        facility_data[:public_phone_number] || facility_data[:phone]
      #   }
      # )
      ## Working
      Facility.new(
        {
          name:         facility_data[:office_name] || facility_data[:name],
          address:      facility_data[:city],
          phone:        facility_data[:public_phone_number] || facility_data[:phone]
        }
      )
    end
    created_facilities
    
    #   Facility.new(
    #     {
    #       name:         "#{facility_data[:office_name] DMV Office}" or "#{facility_data[:name]}",
    #       address:      "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]}" or "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]}",
    #       phone:        "#{facility_data[:public_phone_number]}" or "#{facility_data[:phone]]}"
    #     }
    #   )
    # end
  end
end