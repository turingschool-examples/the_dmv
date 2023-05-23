class FacilityFactory

  def create_oregon_facility(dmv_info)
    dmv_info == DmvDataService.new.or_dmv_office_locations
      dmv_info.map do |info|
        Facility.new({name: info[:title], phone:    info[:phone_number], address: info[:location_1][:human_address]})
      end
  end
end




# elsif dmv_info == DmvDataService.new.ny_dmv_office_locations
#   dmv_info.map do |info|
#     Facility.new({name: info[:office_name], phone:    info[:public_phone_number], address: info[:location_1][:human_address]})
#   ends