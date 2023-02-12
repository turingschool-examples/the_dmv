class FacilitiesByState

  attr_reader :all_facilities

  def initialize
    @or = []
    @ny = []
    @mo = []
    @all_facilities = []
  end

  def create_facilities(data)
    data.each do |facility|
      facility_hash = {
        name: facility[:title] ||= facility[:name] ||= facility[:office_name],
        address: facility[:street_address_line_1] ||= facility[:address1] ||= facility[:location_1][:human_address],
        phone: facility[:phone_number] ||= facility[:public_phone_number] ||= facility[:phone]
      }
      @all_facilities << Facility.new(facility_hash)
    end
  end
end