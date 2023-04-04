class DMVFacility
  attr_reader :list_of_Facilities, :list_of_NY_Facilities 
  def initialize
    @list_of_Facilities = []
    @list_of_NY_Facilities = []
  end

  def create_dmv_facilities(dmv_data)
    dmv_data.map do |facility|
      facility_details = {
        name: facility[:title], 
        address: facility[:location_1],
        phone: facility[:phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      @list_of_Facilities << facility = Facility.new(facility_details)

    end
  end



    def ny_dmv_office_locations(data)
      data.to_a.map do |facility|
        binding.pry
        facility_details = {
          name: facility[:office_name],
          address: "#{facility[:street_address_line_1]}" + ", #{facility[:city]}" + ", #{facility[:state]}",
          phone: facility[:public_phone_number],
          services: [],
          registered_vehicles: [],
          collected_fees: 0
        }
        @list_of_NY_Facilities << facility = Facility.new(facility_details)
        end
    end 

end
