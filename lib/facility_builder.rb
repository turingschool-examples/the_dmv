class FacilityBuilder
  attr_reader :or_facilities, 
              :ny_facilities, 
              :mo_facilities

  def initialize
    @or_facilities = []
    @ny_facilities = []
    @mo_facilities = []
  end

  def build_facility(dmv_office_locations)
    dmv_office_locations.each do |location|
      if location[:state] == 'NY'
        ny_facility_builder(location)
      elsif location[:state] == 'MO'
        mo_facility_builder(location)
      elsif location[:location_1][:human_address].include?('OR')
        or_facility_builder(location)
      end
    end
  end

#Helper Methods

  def or_facility_builder(location)
    location_details = {
      name: location[:title],
      address: location[:location_1][:human_address],
      phone: location[:phone_number]
      }
      @or_facilities << or_facility = Facility.new(location_details)
    @or_facilities
  end

  def mo_facility_builder(location)
    location_details = {
      name: location[:name],
      address: location[:address1],
      phone: location[:phone]
      }
      @mo_facilities << facility = Facility.new(location_details)
    @mo_facilities
  end

  def ny_facility_builder(location)
    location_details = {
      name: location[:office_name],
      address: location[:street_address_line_1],
      phone: location[:public_phone_number]
      }
      @ny_facilities << facility = Facility.new(location_details)
    @ny_facilities
  end
end

