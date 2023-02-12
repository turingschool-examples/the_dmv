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
        name: facility[:title] ||= facility[:office_name],
        address: facility[:location_1][:human_address] ||= facility[:street_address_line_1],
        phone: facility[:phone_number] ||= facility[:public_phone_number]
      }
      @all_facilities << Facility.new(facility_hash)
    end
  end
end