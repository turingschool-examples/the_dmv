class FacilityFactory
  def create_facilities(data)
    data.map do |facility_data|
      facility = Facility.new({name: facility_data[:dmv_office],
        address: facility_data[:address_li],
        phone: facility_data[:phone],
        services: facility_data[:services_p]})
    end
  end
end