class DMVLocation
  def initialize
  end

  def dmv_locations(office_locations)
    locations = []
    office_locations.each do |office|
      office_locations_hash = Hash.new
      office_locations_hash[:name] = office[:title]
      office_locations_hash[:address] = office[:location_1]
      office_locations_hash[:phone] = office[:phone_number]

      locations << DMVLocation.new(office_locations_hash)
    end
    locations
  end
end
