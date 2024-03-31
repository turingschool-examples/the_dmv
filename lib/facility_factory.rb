class FacilityFactory

    def initialize
    end

    def create_facilities(facilities)
        format_data(facilities)
        facilities.map do |facility|
            Facility.new(facility)
        end
    end

    def format_data(facilities)
        facilities.map do |facility|
            facility[:name] = facility.delete :dmv_office
            facility[:address] = facility.values_at(:address_li, :address__1, :city, :state, :zip).join(" ")
        end
    end
end
