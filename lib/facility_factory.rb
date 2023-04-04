class FacilityFactory
  attr_reader :new_facilities
              :dmv_office_locations

  def initialize
    @new_facilities = []
  end
   
  
  def checks_location(location_data)
      dmv_office_locations(location_data)
  end
  
  def dmv_office_locations(location_data)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    ny_dmv_office_locations = DmvDataService.new.ny_dmv_office_locations
    mo_dmv_office_locations = DmvDataService.new.mo_dmv_office_locations

    if location_data == or_dmv_office_locations
        or_dmv_office_locations.each do |office|
           location_data = {
            name: office[:title],
            address: office[:human_address],
            phone: office[:phone_number],
            }
            @new_facilities << (offices = Facility.new(location_data))
        end
        @new_facilities

      elsif
        location_data == ny_dmv_office_locations
        ny_dmv_office_locations.each do |office|
          location_data = {
            name: office[:office_name],
            address: "#{office[:street_address_line_1]},  
                      #{office[:street_address_line_2]},
                      #{office[:city]},
                      #{office[:state]}, 
                      #{office[:zip_code]}",
            phone: office[:public_phone_number]
          }
          @new_facilities << (offices = Facility.new(location_data))
        end
        @new_facilities
      else
        location_data == mo_dmv_office_locations
        mo_dmv_office_locations.each do |office|
          location_data = {
            name: office[:name],
            address: "#{office[:address1]},
                      #{office[:city]}, 
                      #{office[:state]}, 
                      #{office[:zip_code]}",
            phone: office[:phone]
          }
          @new_facilities << (offices = Facility.new(location_data))
        end
          @new_facilities 
      end
    end
    
  end