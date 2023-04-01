require './lib/facility'

class FacilityFactory
  def create_facilities(data)
    data.map do |facility|
      Facility.new({
        name: facility[:title],
        address: facility[:human_address],
        phone: facility[:phone_number]
      })
    end
  end

end
