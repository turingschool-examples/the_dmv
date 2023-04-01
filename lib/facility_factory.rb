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

    def create_facility_new_york(data)
      data.map do |facility|
        Facility.new({
          name: facility[:office_name]
          address: facility[:street_address_line_1]
          phone: facility[:public_phone_numer]
        })
      end
    end

end
