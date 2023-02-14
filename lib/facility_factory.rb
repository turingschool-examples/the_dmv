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
          phone: facility[:phone_number]
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

    else
      facilities.map do |facility|
        facility_details = {
          name: facility[:name],
          address: "#{facility[:address1]} #{facility[:city]} #{facility[:state]} #{facility[:zipcode]}",
          phone: facility[:phone]
        }
        Facility.new(facility_details)
      end
    end
  end
end