class DmvFactory


  def create_facilities(buildings)
    dmv_buildings = []
    buildings.map do |building|
      facility_info = {}
      facility_info[:id] = building[:dmv_id]
      facility_info[:address] = building[:address_li]
      facility_info[:zip] = building[:zip]
      facility_info[:phone] = building[:phone]
      dmv_buildings << facility_info
      # DmvFactory.new(facility_info)
    end
    dmv_buildings
  end
end
