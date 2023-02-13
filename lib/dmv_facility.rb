class DmvFacility
  attr_reader :locations

  def initialize
    @locations = []
  end

  def create_or_facilities(office_locations)
    office_locations.map do |location|
      new_location = {
        name: location[:title],
        address: location[:location_1][:human_address],
        phone: location[:phone_number]
      }
      @locations << Facility.new(new_location)
    end
  end

  def create_ny_facilities(office_locations)
    office_locations.map do |location|
      new_location = {
        name: location[:office_name],
        address: location.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(' '),
        phone: location[:public_phone_number]
      }
      @locations << Facility.new(new_location)
    end
  end
end