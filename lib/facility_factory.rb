class FacilityFactory
  def create_facilities(data)
    facilities = []
    data.each do |facility| #refactor to map
      details = {
        name: facility[:dmv_office],
        address: addr_builder(facility),
        phone: facility[:phone]
      }
      facilities << Facility.new(details)
    end
    facilities
  end

  def addr_builder(facility)
    "#{facility[:address_li]} #{facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}"
  end
end