class FacilityDmv
  attr_reader :facilities

  def initialize
    @facilities = []
  end

  def create_facility(facility_data)
    facility_data.each do |facility|
      facility_hash = {
        title: facility[:title],
        zip_code: facility[:zip_code],
        website: facility[:website],
        phone_number: facility[:phone_number]
        }

        @facilities << Facility.new(facility_hash)
    end
  end
end