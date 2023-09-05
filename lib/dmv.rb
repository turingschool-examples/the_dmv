class Dmv
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def add_facility(facility)
    @facilities << facility
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end

  def add_multiple_facilities(state_facilities_data)
    state_facilities_data.each do |facility|
      # For CO facilities
      if facility[:state] == 'CO'
        facility_details = {
          name: facility[:dmv_office],
          address: "#{facility[:address_li]} #{facility[:address__1]} #{facility[:city]} #{facility[:state]} #{facility[:zip]}",
          phone: facility[:phone]
        }
        # CO specifies services provided, all only provide registration
        new_facility = Facility.new(facility_details)
        new_facility.services = ['Vehicle Registration']
        new_facility.hours = facility[:hours]
        @facilities << new_facility
      # For NY facilities
      elsif facility[:state] == 'NY'
        if facility[:street_address_line_2] != nil
          address_full = "#{facility[:street_address_line_1]} #{facility[:street_address_line_2]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
        else
          address_full = "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}"
        end
        phone_extract = facility[:public_phone_number].to_s

        facility_details = {
          name: facility[:office_name],
          address: address_full,
          phone: "(#{phone_extract[0..2]}) #{phone_extract[3..5]}-#{phone_extract[6..9]}"
        }
        # NY has no specified services for facilities
        new_facility = Facility.new(facility_details)
        @facilities << new_facility
      # For MO facilities
      elsif facility[:state] == 'MO'
        facility_details = {
          name: facility[:name],
          address: "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}",
          phone: facility[:phone], 
        }
        # MO has no clearly specified services for facilities
        new_facility = Facility.new(facility_details)
        @facilities << new_facility
      else
        false
      end
    end
  end
end
