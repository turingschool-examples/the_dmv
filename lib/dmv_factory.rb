class DmvFactory

  def create_colorado_facilities(buildings)
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

  def create_new_york_facilities(buildings)
    dmv_buildings = []
    buildings.map do |building|
      facility_info = {}
      facility_info[:address] = building[:street_address_line_1]
      facility_info[:zip] = building[:zip_code]
      facility_info[:phone] = building[:public_phone_number]
      dmv_buildings << facility_info
    end
    dmv_buildings
  end

  def create_missouri_facilities(buildings)
    dmv_buildings = []
    buildings.map do |building|
      facility_info = {}
      facility_info[:address] = building[:address1]
      facility_info[:zip] = building[:zipcode]
      facility_info[:phone] = building[:phone]
      dmv_buildings << facility_info
    end
    dmv_buildings
  end

end
