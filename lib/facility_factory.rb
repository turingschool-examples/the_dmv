class FacilityFactory

  def initialize
  end

  def create_facilities(facilities)
    if facilities[0].keys.include?(:location_1)
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

    elsif facilities[0].keys.include?(:office_name)
      facilities.map do |facility|
        facility_details = {
          name: facility[:office_name],
          address: "#{facility[:street_address_line_1]} #{facility[:city]} #{facility[:state]} #{facility[:zip_code]}",
          phone: facility[:public_phone_number]
        }
        Facility.new(facility_details)
      end

    elsif facilities[0].keys.include?(:dorregionnumber)
      facilities.map do |facility|
        facility_details = {
          name: facility[:name],
          address: "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}",
          phone: facility[:phone],
          hours: {
            Monday: "8:30AM - 5:00PM",
            Tuesday: "8:00AM - 5:00PM",
            Wednesday: "8:00AM - 5:00PM",
            Thursday: "8:00AM - 5:00PM",
            Friday: "8:00AM - 5:00PM"
          },
          holidays: "Independence Day (07/04/22), Labor Day (09/05/22), Columbus Day (10/10/22), Veterans Day (11/11/22), Thanksgiving (11/24/22), Christmas Day Observed (12/26/22), New Year's Day Observed (01/02/23), Martin Luther King Day (01/16/23), Lincoln’s Birthday (02/13/23), President’s Day (02/20/23), Truman’s Birthday (05/08/23), Memorial Day (05/29/23), Independence Day (07/04/23), Labor Day (09/04/23), Columbus Day (10/09/23), Veterans Day (11/10/23), Thanksgiving (11/23/23), Christmas Day Observed (12/25/23)"
        }
        Facility.new(facility_details)
      end
    else
      facilities.map{ |facility| Facility.new(facility)}
    end
  end
end