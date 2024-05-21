class FacilityCreator
    def create_facilities(facilities_info)
      facilities = []
  
      if facilities_info
        facilities_info.each do |facility_info|
        facility_details = {
          address: facility_info[:address_li] || facility_info[:street_address_1] || facility_info[:street_address_line_1],
          city: facility_info[:city],
          state: facility_info[:state],
          zip: facility_info[:zip] || facility_info[:zip_code],
          phone: facility_info[:phone] || facility_info[:public_phone_number]
        }
  
        facility = Facility.new(facility_details)
        facilities << facility
      end
  
      facilities
    end
  end
  
end
#facility_creator = FacilityCreator.new
#facilities = facility_creator.create_facilities(co_dmv_office_locations)
#facilities = facility_creator.create_facilities(ny_dmv_office_locations)
#facilities = facility_creator.create_facilities(mo_dmv_office_locations)