class RemoteOffice

  attr_reader :other_offices,
              :remote_office_locations
  def initialize
    @other_offices = []
  end

  def checks_location(location_data)
    remote_office_locations(location_data)
  end

  def remote_office_locations(location_data)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
    ny_office_locations = DmvDataService.new.ny_dmv_office_locations
    mo_office_locations = DmvDataService.new.mo_dmv_office_locations
      if location_data == or_dmv_office_locations
        or_dmv_office_locations.each do |office|
           location_data = {
            name: office[:title],
            address: office[:human_address],
            phone: office[:phone_number],
            }
            @other_offices << (offices = Facility.new(location_data))
        end
        @other_offices
      elsif location_data == ny_office_locations
        ny_office_locations.each do |office|
          location_data = {
            name: office[:office_name],
            address: "#{office[:street_address_line_1]}, #{office[:street_address_line_2]}, #{office[:city]}, #{office[:state]}, #{office[:zip_code]}",
            phone: office[:public_phone_number]
          }
          @other_offices << (offices = Facility.new(location_data))
        end
        @other_offices
      else location_data == mo_office_locations
        mo_office_locations.each do |office|
          location_data = {
            name: office[:name],
            address: "#{office[:address1]}, #{office[:city]}, #{office[:state]}, #{office[:zip_code]}",
            phone: office[:phone]
          }
          @other_offices << (offices = Facility.new(location_data))
        end
          @other_offices  
      end
    end
  end