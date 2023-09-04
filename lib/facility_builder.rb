class FacilityBuilder
  attr_reader :facility_list
              :facility_details
  # def co_facility_helper(data)
  #   @facility_list = data.map do |facility|
  #     facility = facility.slice(:dmv_office, :address_li, :address_1, :city, :state, :zip, :phone)
  #     full_address = []
  #     filter = [:address_li, :address__1, :city, :state, :zip]
  #     @facility_details = facility.map do |key, value|
  #       if key == :dmv_office
  #         key = :name, value = value
  #       elsif filter.include?(key)
  #         full_address << value
  #         key = :address, value = full_address.join(' ')
  #       else 
  #         key = key, value = value
  #       end
  #     end.to_h
  #   end
  #   @facility_list
  # end

def build_facility_helper(data)
  # binding.pry
  @facility_list = data.map do |facility|
    # binding.pry
    if facility[:state] == 'CO'
      full_address = [facility[:address_li], facility[:address__1], facility[:city], facility[:state], facility[:zip]]
      # binding.pry
      facility_details = { name: facility[:dmv_office], address: full_address.join(' '), phone: facility[:phone]}
      # binding.pry
    elsif facility[:state] == 'NY'
      full_address = [facility[:street_address_line_1], facility[:city], facility[:state], facility[:zip_code]]
      # binding.pry
      facility_details = { name: facility[:office_name], address: full_address.join(' '), phone: facility[:public_phone_number]}
      # binding.pry
    elsif facility[:state] == 'MO'
      full_address = [facility[:address1], facility[:city], facility[:state], facility[:zipcode]]
      # binding.pry
      facility_details = {name: facility[:name], address: full_address.join(' '), phone: facility[:phone]}
      # binding.pry
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