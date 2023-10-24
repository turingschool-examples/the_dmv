class FacilityList
    attr_reader :facilities

    def initialize
        @facilities = []
    end

    def parse_facilities(facilities)
        facilities.each do |facility_api|
            facility_ours = Facility.new(facility_api)

            if facility_api[:state] == "CO"
                facility_ours.name = facility_api[:dmv_office]
                address_1, address_2, city, state, zip = facility_api.values_at(:address_li, :address__1, :city, :state, :zip)
                facility_ours.address = "#{address_1} #{address_2} #{city} #{state} #{zip}"
                facility_ours.address.gsub(/  /, " ")
                facility_ours.hours = facility_api[:hours]

            elsif facility_api[:state] == "NY"
                facility_ours.name = facility_api[:office_name]
                address_1, city, state, zip = facility_api.values_at(:street_address_line_1, :city, :state, :zip_code)
                facility_ours.address = "#{address_1} #{city} #{state} #{zip}"
                facility_ours.address.gsub(/  /, " ")
                facility_ours.phone = facility_api[:public_phone_number]
                
                monday_beg, monday_end, tuesday_beg, tuesday_end, wednesday_beg, wednesday_end, thursday_beg, thursday_end, friday_beg, friday_end = facility_api.values_at(:monday_beginning_hours, :monday_ending_hours, :tuesday_beginning_hours, :tuesday_ending_hours, :wednesday_beginning_hours, :wednesday_ending_hours, :thursday_beginning_hours, :thursday_ending_hours, :friday_beginning_hours, :friday_ending_hours)
                facility_ours.hours = "Monday: #{monday_beg} to #{monday_end}, Tuesday: #{tuesday_beg} to #{tuesday_end}, Wednesday: #{wednesday_beg} to #{wednesday_end}, Thursday: #{thursday_beg} to #{thursday_end}, Friday: #{friday_beg} to #{friday_end}"


            elsif facility_api[:state] == "MO"
                address_1, city, state, zip = facility_api.values_at(:address1, :city, :state, :zipcode)
                facility_ours.address = "#{address_1} #{city} #{state} #{zip}"
                facility_ours.address.gsub(/  /, " ")
                facility_ours.hours = facility_api[:daysopen]

            end
            @facilities << facility_ours
        end
    end
end