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
    if key.to_s.downcase.include?("name") || key.to_s.downcase.include?("title")
      formatted_facility[:name] = value
    elsif key.to_s.downcase.include?("address") || key.to_s.downcase.include?("location")
      if value.is_a?(Hash)
        formatted_facility[:address] = JSON.parse(value[:human_address])["address"]
      else
        formatted_facility[:address] = value
      end
    elsif key.to_s.downcase.include?("phone") && formatted_facility[:phone] == nil
      formatted_facility[:phone] = value
    else
      formatted_facility[key] = value
    end
  end

  formatted_facility
end
