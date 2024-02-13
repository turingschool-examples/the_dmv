class FacilityFactory

    def pull_facilities(hash_data)
        facility = hash_data.map do |facility|
            Facility.new(facility)
        end
    end
end
