require './lib/facility'

class DmvFactory
    attr_reader :state_dmv_locations
  
    def initialize(dmv_office_locations)
      @state_dmv_locations = dmv_office_locations
    end
  
    def create_facilities
      state_dmv_locations.map do |location|
        Facility.new(
          title: location[:title],
          zip_code: location[:zip_code],
          website: location[:website],
          phone_number: location[:phone_number],
          latitude: location[:location_1][:latitude],
          longitude: location[:location_1][:longitude]
        )
      end
    end
end