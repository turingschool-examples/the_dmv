class FacilityFactory
  def initialize

  end

  def create_facilities(facilities_data)
    created_facilities = facilities_data.map do |facility_data|
      Facility.new(
        {
          name:         facility_data[:office_name] || facility_data[:name],
          address:      facility_data[:city],
          phone:        facility_data[:public_phone_number] || facility_data[:phone]
        }
      )
    end
    #   Facility.new(
    #     {
    #       name:         "#{facility_data[:office_name] DMV Office}" or "#{facility_data[:name]}",
    #       address:      "#{facility_data[:street_address_line_1]}, #{facility_data[:city]}, #{facility_data[:state]}" or "#{facility_data[:address1]}, #{facility_data[:city]}, #{facility_data[:state]}",
    #       phone:        "#{facility_data[:public_phone_number]}" or "#{facility_data[:phone]]}"
    #     }
    #   )
    # end
    created_facilities
  end
end