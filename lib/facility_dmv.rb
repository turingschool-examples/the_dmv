class FacilityDmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        name: facility[:title],
        zip_code: facility[:zip_code],
        website: facility[:website],
        type: facility[:type],
        phone: facility[:phone_number],
        agency: facility[:agency],
        address: facility[:location_1][:human_address]
        }
# require 'pry'; binding.pry
        @facilities << Facility.new(facility_hash)
        require 'pry'; binding.pry
    end
  end
end