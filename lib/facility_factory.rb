require './lib/facility'

class FacilityFactory
  def create_facility_oregon(data)
    data.map do |facility|
      Facility.new({
        name: facility[:title],
        address: facility[:human_address],
        phone: facility[:phone_number]
      })
    end
  end

end
