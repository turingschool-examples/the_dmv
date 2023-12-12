require './lib/facility'

class FacilityFactory
  def create_facilities(data, name_key, address_key, phone_key, hour_key=nil)
    data.map do |facility_data|
      daily_hours =
        if hour_key
          facility_data[hour_key]
        else
          daily_hours_ny(facility_data)
        end
      Facility.new( {
        name: facility_data[name_key],
        address: facility_data[address_key],
        phone: facility_data[phone_key],
        daily_hours: daily_hours
        }
      )
    end
  end


end
