class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facilities(data)
    facility_data = []
    data.each do |facility_hash|
      facility_details = {}
      facility_details[:name] = facility_hash[:title]
      facility_details[:address] = address(facility_hash)
      facility_details[:phone] = facility_hash[:phone_number]
      facility_data << facility_details
    end
    facility_data.each do |facility_details|
      @facilities << Facility.new(facility_details)
    end
    @facilities
  end

  def address(facility_hash)
    address = facility_hash[:location_1][:human_address]
  end
end