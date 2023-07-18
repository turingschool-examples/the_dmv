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
    if facility[:state] == "CO"
      "#{facility[:address_li]} #{facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}"
    elsif facility[:state] == "NY"
      "#{facility[:street_address_line_1]} #{facility[:street_address_line_2]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
    end
  end
end