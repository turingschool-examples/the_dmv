class FacilityFactory

  def create_facilities(facility_data)
    facility = facility_data.map do |facility|
      Facility.new(facility)
    end
  end
end