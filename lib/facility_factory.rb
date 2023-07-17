class FacilityFactory
  def initialize
  end

  def create_facilities(locations)
    facilities = []
    locations.each do |location|
      new_facility = Facility.new({
        name: location[:dmv_office],
        address: "#{location[:address_li]} #{location[:address__1]} #{location[:city]}, #{location[:state]} #{location[:zip]}",
        phone: location[:phone]
      })
      new_facility.add_service(location[:services_p])
      facilities << new_facility
    end
    facilities
  end
end