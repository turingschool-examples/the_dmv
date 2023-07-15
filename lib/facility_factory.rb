class FacilityFactory

  def create_facilities(facilities)
    facilities.map do |facility|
      name = facility[:dmv_office]
      name = Facility.new(facility)
    end
  end

end