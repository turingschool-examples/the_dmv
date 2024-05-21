class FacilityFactory
  def initialize

  end

  def create_facilities(facility_database)
    if facility_database.first[:state] == "CO"
      return build_co_facilities(facility_database)
    elsif facility_database.first[:state] == "NY"
      return build_ny_facilities(facility_database)
    else facility_database.first[:state] == "MO"
      return build_mo_facilities(facility_database)
    end
  end

  def build_co_facilities(facility_database)
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

  def build_ny_facilities(facility_database)
    facility_database.map do |potential_facility|
      facility_deets = {}
      facility_deets[:name] = potential_facility[:office_name]
      facility_deets[:phone] = potential_facility[:public_phone_number]
      facility_deets[:address] = "#{potential_facility[:street_address_line_1]} " \
                                  "#{potential_facility[:city]} " \
                                  "#{potential_facility[:state]} " \
                                  "#{potential_facility[:zip_code]}" 
      facility_deets[:services] = [] if potential_facility[:services_p].nil?
                                  
      Facility.new(facility_deets)
    end
  end

  def build_mo_facilities(facility_database)
    facility_database.map do |potential_facility|
      facility_deets = {}
      facility_deets[:name] = potential_facility[:dmv_office]
      facility_deets[:phone] = potential_facility[:phone]
      facility_deets[:address] = "#{potential_facility[:address1]} " \
                                  "#{potential_facility[:city]} " \
                                  "#{potential_facility[:state]} " \
                                  "#{potential_facility[:zipcode]}" 
      facility_deets[:services] = [] if potential_facility[:services_p].nil?

      Facility.new(facility_deets)
    end
  end

end