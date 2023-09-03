# class FacilityFactory
#   def create_facilities(data)
#     data.map do |facility_data|
#       facility = Facility.new({name: facility_data[:dmv_office],
#         address: facility_data[:address_li],
#         phone: facility_data[:phone]})
#     end
#   end

  # facility_data[:address__l], facility_data[:city], facility_data[:state], facility_data[:zip]

  # def get_co_address(facility_data)
  #   facility_data[:address_li]
  #   facility_data[:address_li]
  # end

  
# end


#facility needs to have name, address, phone
  #co 
      #name: facility_data[:dmv_office]
      #address: facility_data[:address_li]
      #phone: facility_data[:phone]

  #ny 
      #name: facility_data[:office_name]
      #address: facility_data[:]



class FacilityFactory
  def create_facilities(data)
    if data == DmvDataService.new.co_dmv_office_locations
      data.map do |facility_data|
      facility = Facility.new({name: facility_data[:dmv_office],
        address: facility_data[:address_li],
        phone: facility_data[:phone]})
      end 
    elsif data == DmvDataService.new.ny_dmv_office_locations
      data.map do |facility_data|
      facility = Facility.new({name: facility_data[:office_name],
        address: facility_data[:street_address_line_1],
        phone: facility_data[:public_phone_number]})
      end 
    elsif data == DmvDataService.new.mo_dmv_office_locations
      data.map do |facility_data|
      facility = Facility.new({name: facility_data[:name],
        address: facility_data[:address1],
        phone: facility_data[:phone]})
      end 
    end 
    
  end
end