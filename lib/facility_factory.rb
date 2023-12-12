class FacilityFactory
    
    def create_facilities(facility_details)
        facilities_created = []
        facility_details.each do |facility|
            facilities_created << Facility.new(facility)
        end
        facilities_created
    end

end