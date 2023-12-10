class FacilityMaker

    attr_reader :new_facilities, :new_facility_data

    def initialize(dmv_data)
        @dmv_data = dmv_data
        @new_facilities = []
        @new_facility_data = {}
    end

    def facility_maker_co
        if @dmv_data.first[:state] == "CO"
            data_organizer_co
        end
    end    

    def data_organizer_co
        @dmv_data.each do |location_data|
            @new_facility_data[:name] = location_data[:dmv_office]
            @new_facility_data[:address] = "#{location_data[:address_li]} #{location_data[:address__1]} #{location_data[:city]} #{location_data[:state]} #{location_data[:zip]}"
            @new_facility_data[:phone] = location_data[:phone]
            @new_facility_data[:hours] = location_data[:hours]
            @new_facilities << Facility.new(@new_facility_data)
            @new_facilities.last.add_service(location_data[:services_p])
        end
    end

    def facility_maker_ny
        if @dmv_data.first[:state] == "NY"
            data_organizer_ny
        end
    end    

    def data_organizer_ny
        @dmv_data.each do |location_data|
            @new_facility_data[:name] = location_data[:office_name]
            @new_facility_data[:address] = "#{location_data[:street_address_line_1]} #{location_data[:city]} #{location_data[:state]} #{location_data[:zip_code]}"
            ny_hours_maker(location_data)
                if location_data[:public_phone_number] != nil
                    @new_facility_data[:phone] = location_data[:public_phone_number]
                else
                    @new_facility_data[:phone] = "No Public Phone Number"
                end
            @new_facilities << Facility.new(@new_facility_data)
        end
    end

    def ny_hours_maker(location_data)
        @new_facility_data[:hours] = "Mon. - Tu.: #{location_data[:monday_beginning_hours]}-#{location_data[:tuesday_ending_hours]}, Weds.: #{location_data[:wednesday_beginning_hours]}-#{location_data[:wednesday_ending_hours]}, Thurs. - Fri.: #{location_data[:thursday_beginning_hours]}-#{location_data[:friday_ending_hours]}"
    end

    def facility_maker_mo
        if @dmv_data.first[:state] == "MO"
            data_organizer_mo
        end
    end    

    def data_organizer_mo
        @dmv_data.each do |location_data|
            @new_facility_data[:name] = location_data[:name]
            @new_facility_data[:address] = "#{location_data[:address1]} #{location_data[:city]} #{location_data[:state]} #{location_data[:zipcode]}"
            @new_facility_data[:hours] = location_data[:daysopen]
            @new_facility_data[:holiday_closures] = "#{location_data[:holidaysclosed]} and #{location_data[:additionaldaysclosed]}"
                if location_data[:phone] != nil
                    @new_facility_data[:phone] = location_data[:phone]
                else
                    @new_facility_data[:phone] = "No Public Phone Number"
                end
            @new_facilities << Facility.new(@new_facility_data)
        end
    end

    def facility_maker
        facility_maker_co
        facility_maker_mo
        facility_maker_ny
    end
end

