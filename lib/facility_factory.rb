class FacilityFactory
 def or_facility_creator(or_dmv_data)
  or_dmv_info = []
  or_dmv_data.each do |data|
    or_dmv_info << Facility.new({
      name: data[:title], 
      address: data[:human_address], 
      phone: data[:phone_number]})
    require 'pry'; binding.pry
  end


 end
end

