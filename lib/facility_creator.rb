class FacilityCreator

  def create_facility(facility_information)
    facilities = []
    facility_information.each do |facility|
      if facility.keys.include?(:address__1)
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

# binding.pry