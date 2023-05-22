class FacilityLocation


  def create_facility(locations)
    dmv_locations = formatted_location(locations)
    facilities = []
    dmv_locations.each do |location|
      facilities << Facility.new(location)
    end
    facilities
  end

