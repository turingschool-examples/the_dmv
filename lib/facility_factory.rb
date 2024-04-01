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
        if facilities.first.has_key?(:dmv_office)
            co_format(facilities)
        elsif facilities.first.has_key?(:address1)
            mo_format(facilities)
        else
            ny_format(facilities)
        end
    end

    def co_format(facilities)
        facilities.map do |facility|
            facility[:name] = facility.delete :dmv_office
            facility[:address] = facility.values_at(:address_li, :address__1, :city, :state, :zip).join(" ")
        end
    end

    def ny_format(facilities)
        facilities.map do |facility|
            facility[:name] = facility.delete :office_name
            facility[:phone] = facility.delete :public_phone_number
            facility[:address] = facility.values_at(:street_address_line_1, :city, :state, :zip_code).join(" ")
        end
    end

    def mo_format(facilities)
        facilities.map do |facility|
        facility[:address] = facility.values_at(:address1, :city, :state, :zipcode).join(" ")
        end
    end
end
