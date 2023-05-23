require 'json'

class FacilityCreator

    def create_oregon_facilities(state_data)
      state_data.map do |facility|
        facility_data = format_facility_data(facility)
        Facility.new({
          title: facility_data[:title],
          address: facility_data[:address],
          phone: facility_data[:phone]
          })
      end
    end

    def create_ny_facilities(state_data)
      state_data.map do |facility|
        facility_data = format_facility_data(facility)
        Facility.new({
          name: facility_data[:name],
          address: facility_data[:address],
          phone: facility_data[:phone]
        })
      end
    end

    def format_facility_data(facility)
        data = {
        name: format_name(facility),
        address: format_address(facility),
        phone: format_phone_number(facility)
      }
    end

    def format_name(data)
        if data[:website] && data[:website].include?("oregon")
          data[:title]
        elsif data[:state] && data[:state] == "ny"
          data[:office_name]
        else data[:state] && data[:state] == "missouri"
          data[:name]
        end
    end

    def format_address(data)
    end

    def format_phone_number(data)
    end
end