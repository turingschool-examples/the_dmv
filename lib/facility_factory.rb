class FacilityFactory


  def initialize

  end

  def create_facilities(data)
    new_facilities = data.map do |facility|
      Facility.new(
        {
        name: facility[:title] || facility[:office_name] || facility[:name],

        address: 
        if !facility[:location_1].nil?
          formatted_address = JSON.parse(facility[:location_1][:human_address], symbolize_names: true)
          "#{formatted_address[:address]}, #{formatted_address[:city]}, #{formatted_address[:state]} #{formatted_address[:zip]}"
        elsif !facility[:street_address_line_1].nil?
          "#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip_code]}"
        elsif !facility[:address1].nil?
          "#{facility[:address1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zipcode]}"
        end, 
        
        phone: facility[:phone_number] || facility[:phone] ||= "N/A",
        services: [],
        registered_vehicles: [],
        collected_fees: 0
        }
      )
    end
    
  end

 


end