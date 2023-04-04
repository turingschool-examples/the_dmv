class FacilityFactory


  def initialize

  end

  def create_facilities(dmv)
    new_facilities = dmv.map do |facility|
      Facility.new(
        {
        name: facility[:title] || facility[:office_name],

        address: 
        if !facility[:street_address_line_1].nil?
          "#{facility[:street_address_line_1]}, #{facility[:city]}, #{facility[:state]} #{facility[:zip_code]}"
        else
          facility[:zip_code]
        end, 
        
        phone: facility[:phone_number] ||= "N/A",
        services: [],
        registered_vehicles: [],
        collected_fees: 0
        }
      )
    end
    
  end

 


end