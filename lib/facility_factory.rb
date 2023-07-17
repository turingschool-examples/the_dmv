class FacilityFactory
  def initialize
  end

  def create_facilities(locations)
    facilities = []
    locations.each do |location|
      new_facility = Facility.new({
        name: location[:dmv_office],
        #need to fix:
        address: location[:address_li + " " + :address__1 + " " + :city + ", " + :state + " " + :zip],
        phone: location[:phone],
        services: location[:services_p]
      })
      facilities << new_facility
    end
    facilities
  end
end