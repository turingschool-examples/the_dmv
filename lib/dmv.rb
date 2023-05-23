class Dmv

  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def add_facility(facilities)
    if facilities.is_a?(Array)
      facilities.each do |facility|
        formatted_data = facility_formatter(facility)
        new_facility = Facility.new(formatted_data)
        @facilities << new_facility
      end 
    else 
      formatted_data = facility_formatter(facilities)
      new_facility = Facility.new(formatted_data)
      @facilities << new_facility
    end
    @facilities
  end

  def facilities_offering_service(service)
    @facilities.find_all do |facility|
      facility.services.include?(service)
    end
  end
end


def facility_formatter(facility)
  formatted_facility = {}

  facility.each do |key, value|
    if key.to_s.downcase == "location_1"
      if value.is_a?(Hash) && value.key?(:human_address)
        parsed_address = JSON.parse(value[:human_address])
        formatted_facility[:address] = parsed_address["address"]
        formatted_facility[:city] = parsed_address["city"]
        formatted_facility[:state] = parsed_address["state"]
        formatted_facility[:zip] = parsed_address["zip"]
      end

    elsif key.to_s.downcase.include?("address")
      formatted_facility[:address] = value
    elsif key.to_s.downcase.include?("name") || key.to_s.downcase.include?("title")
      formatted_facility[:name] = value
    elsif key.to_s.downcase.include?("phone") && formatted_facility[:phone].nil?
      formatted_facility[:phone] = value
    elsif key.to_s.downcase.include?("zip")
      formatted_facility[:zip] = value
    elsif key.to_s.downcase.include?("type")
      formatted_facility[:type] = value
    elsif key.to_s.downcase.include?("web")
      formatted_facility[:website] = value

    elsif key.to_s.downcase == "othercontactinfo"
      website_location = value.split("Website: ")
      website = website_location[1]
      formatted_facility[:website] = website
    else
      formatted_facility[key] = value
    end
  end

  formatted_facility
end
