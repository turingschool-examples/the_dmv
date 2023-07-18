class FacilityFactory
  def create_facilities(data)
    #name address phone services
    facilities = []

    data.each do |facility|
      full_addr = "#{facility[:address_li]} #{facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}"
      details = {
        name: facility[:dmv_office],
        address: full_addr,
        phone: facility[:phone]
      }
      facilities << Facility.new(details)
    end
    facilities
  end
end