class FacilityFactory

  def initialize
  end

  def create_facilities(facilities)
      facilities.map do |facility|
        location = JSON.parse(facility[:location_1][:human_address].gsub('\"', ''))
        facility_details = {
          name: facility[:title],
          address: location.values.join(' '),
          phone: facility[:phone_number],
          hours: {
            Monday: "8:30AM - 4:15PM",
            Tuesday: "8:30AM - 4:15PM",
            Wednesday: "8:30AM - 4:15PM",
            Thursday: "8:30AM - 5:45PM",
            Friday: "8:30AM - 4:15PM"
          }
        }
        Facility.new(facility_details)
      end
  end
end