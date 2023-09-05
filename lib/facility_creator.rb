class FacilityCreator

  def create_facility(facility_information)
    facilities = []
    facility_information.each do |facility|
    if facility.keys.include?(:office_name)
      facilities << Facility.new({
      name: facility[:office_name] + " " + facility[:office_type], 
      address: facility[:street_address_line_1] + " " + facility[:city] + " " + facility[:state]+ " " + facility[:zip_code], 
      phone: facility[:public_phone_number].insert(0,"(").insert(4,") ").insert(9,"-")})
    elsif facility.keys.include?(:dorregionnumber)
      facilities << Facility.new({
      name: facility[:name] + " LICENSE OFFICE", 
      address: facility[:address1] + " " + facility[:city] + " " + facility[:state]+ " " + facility[:zipcode], 
      phone: facility[:phone]})
    elsif facility.keys.include?(:address__1)
      facilities << Facility.new({
      name: facility[:dmv_office], 
      address: facility[:address_li] + " " + facility[:address__1] + " " + facility[:city] + " " + facility[:state]+ " " + facility[:zip], 
      phone: facility[:phone]})
    else
      facilities << Facility.new({
      name: facility[:dmv_office], 
      address: facility[:address_li] + " " + facility[:city] + " " + facility[:state]+ " " + facility[:zip], 
      phone: facility[:phone]})
    end
    end
  facilities
  end
end

