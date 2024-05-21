class FacilityFactory
  def initialize

  end

  def create_facilities(facility_database)

    facility_database.map do |potential_facility|
      facility_deets = {}
      facility_deets[:name] = potential_facility[:dmv_office]
      facility_deets[:phone] = potential_facility[:phone]
      facility_deets[:address] = "#{potential_facility[:address_li]} " \
                                  "#{potential_facility[:address__1]} " \
                                  "#{potential_facility[:city]} " \
                                  "#{potential_facility[:state]} " \
                                  "#{potential_facility[:zip]}"
      facility_deets[:services] = potential_facility[:services_p]

      Facility.new(facility_deets)
    end

  end
end