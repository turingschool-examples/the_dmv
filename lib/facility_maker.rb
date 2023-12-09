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
            @new_facility_data[:address] = "#{location_data[:stree_address_line_1]} #{location_data[:city]} #{location_data[:state]} #{location_data[:zip_code]}"
                if location_data[:public_phone_number] != nil
                    @new_facility_data[:phone] = location_data[:public_phone_number]
                else
                    @new_facility_data[:phone] = "No Public Phone Number"
                end
            @new_facilities << Facility.new(@new_facility_data)
            @new_facilities.last.add_service(location_data[:services_p])
        end
    end
end

