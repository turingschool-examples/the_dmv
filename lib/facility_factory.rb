class FacilityFactory
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_or_facilities(data)
    facility_data = []
    data.each do |facility_hash|
      facility_details = {}
      facility_details[:name] = facility_hash[:title]
      facility_details[:address] = or_address(facility_hash)
      facility_details[:phone] = facility_hash[:phone_number]
      facility_data << facility_details
    end
    facility_data.each do |facility_details|
      @facilities << Facility.new(facility_details)
    end
    @facilities
  end

  def or_address(facility_hash)
    or_address = facility_hash[:location_1][:human_address]
  end

  def create_ny_facilities(data)
    facility_data = []
    data.each do |facility_hash|
      facility_details = {}
      facility_details[:name] = facility_hash[:office_name]
      facility_details[:address] = ny_address(facility_hash)
      facility_details[:phone] = facility_hash[:public_phone_number]
      facility_data << facility_details
    end
    facility_data.each do |facility_details|
      @facilities << Facility.new(facility_details)
    end
    @facilities
  end

  def ny_address(facility_hash)
    ny_address = [facility_hash[:street_address_line_1], 
                  facility_hash[:city], 
                  facility_hash[:state], 
                  facility_hash[:zip_code]].join(' ')
  end


end