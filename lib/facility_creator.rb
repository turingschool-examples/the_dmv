require 'json'

class FacilityCreator

    def create_facilities(state_data)
      state_data.map do |facility|
        facility_data = format_facility_data(facility)
        Facility.new({
          title: facility_data[:title],
          address: facility_data[:address],
          phone: facility_data[:phone]
          })
      end
    end
end