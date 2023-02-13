class DmvFacility
  attr_reader :locations

  def initialize
    @locations = []
  end

  def create_facilities(office_locations)
    office_locations.map do |location|
      # chuck_norris = Hash[:punch, 99, :kick, 98, :stops_bullets_with_hands, true]
      # new_location = Hash[:name, location[:title], :address, location[:location_1][:human_address], :phone, location[:phone_number]]
      new_location = {
        name: location[:title],
        address: location[:location_1][:human_address],
        phone: location[:phone_number],
      }
      @locations << Facility.new(new_location)
    end
  end
end