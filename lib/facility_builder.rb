class FacilityBuilder
  attr_reader :facility_list

def build_facility_helper(data)
  @facility_list = data.map do |facility|
    if facility[:state] == 'CO'
      full_address = [facility[:address_li], facility[:address__1], facility[:city], facility[:state], facility[:zip]]  
      facility_details = { name: facility[:dmv_office], address: full_address.join(' '), phone: facility[:phone]}
    elsif facility[:state] == 'NY'
      full_address = [facility[:street_address_line_1], facility[:city], facility[:state], facility[:zip_code]]
      facility_details = { name: facility[:office_name], address: full_address.join(' '), phone: facility[:public_phone_number]}
    elsif facility[:state] == 'MO'
      full_address = [facility[:address1], facility[:city], facility[:state], facility[:zipcode]]
      facility_details = {name: facility[:name], address: full_address.join(' '), phone: facility[:phone]}
    else
      'No format prepared'
    end
  end
end

  def build_facility(data)
    self.build_facility_helper(data)
    facilities = @facility_list.map do |facility|
      Facility.new(facility)
    end
  end
end