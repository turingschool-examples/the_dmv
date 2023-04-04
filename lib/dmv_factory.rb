class DMVFacility
  attr_reader :list_of_OR_Facilities, 
              :list_of_NY_Facilities, 
              :list_of_MO_Facilities,
              :list_of_DMVs 
  def initialize
    @list_of_OR_Facilities = []
    @list_of_NY_Facilities = []
    @list_of_MO_Facilities = []
    @list_of_DMVs = []
  end



  def create_dmv_facilities(data)
    data.map do |facility|
      if facility.has_key?(:title)
        create_or_dmv_facilities(data)
        @list_of_DMVs << @list_of_OR_Facilities
      elsif facility.has_key?(:office_name)
        create_ny_dmv_office_locations(data)
        @list_of_DMVs << @list_of_NY_Facilities
      else
        create_mo_dmv_office_locations(data)
        @list_of_DMVs << @list_of_MO_Facilities
      end
    end
      
  end
        
   #helper methods 

  def create_or_dmv_facilities(dmv_data)
    dmv_data.map do |facility|
      facility_details = {
        name: facility[:title], 
        address: facility[:location_1],
        phone: facility[:phone_number],
        services: [],
        registered_vehicles: [],
        collected_fees: 0
      }
      @list_of_OR_Facilities << facility = Facility.new(facility_details)

    end
  end



    def create_ny_dmv_office_locations(data)
      data.to_a.map do |facility|
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
    
    def create_mo_dmv_office_locations(data)
      data.to_a.map do |facility|
        facility_details = {
          name: facility[:name],
          address: "#{facility[:address1]}" + ", #{facility[:city]}" + ", #{facility[:state]}",
          phone: facility[:phone],
          services: [],
          registered_vehicles: [],
          collected_fees: 0
        }
        @list_of_MO_Facilities << facility = Facility.new(facility_details)
        end
    end

end
