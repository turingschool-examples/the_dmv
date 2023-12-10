class OfficeLocations

    def create_facility(source)
        source.each do |facility|
            if facility.keys.include?(:dmv_office)
                co_create_facility(source)
            elsif facility.keys.include?(:office_name)
                ny_create_facility(source)
            else facility.keys.include?(:name)
                mo_create_facility(source)
            end
        end
    end

    def daily_hours(source)
        daily_hours = {}   
            source.each do |facility|
                if facility.keys.include?(:dmv_office)
                    daily_hours[facility[:dmv_office]] = facility[:hours]
                elsif facility.keys.include?(:office_name)
                    name = facility[:office_name]
                    daily_hours[name] = ny_daily_hours_hash(source)
                elsif facility.keys.include?(:name)
                    daily_hours[facility[:name]] = facility[:daysopen]
                end
            end
        daily_hours
    end

    def ny_daily_hours_hash(source)
        ny_daily_hours = {}
      
        source.each do |hash|
          hash.each do |key, value|
            if key.to_s.include?("hours")
              ny_daily_hours[key] = value
            end
          end
        end
      
        ny_daily_hours
      end

    

    # "monday_beginning_hours":"7:30 AM","monday_ending_hours":"5:00 PM","tuesday_beginning_hours":"7:30 AM","tuesday_ending_hours":"5:00 PM","wednesday_beginning_hours":"7:30 AM","wednesday_ending_hours":"5:00 PM","thursday_beginning_hours":"7:30 AM","thursday_ending_hours":"5:00 PM","friday_beginning_hours":"7:30 AM","friday_ending_hours":"5:00 PM"

    def holidays_closed(source)

    end
          
      
    def co_create_facility(source)
        co_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:dmv_office],
                address = {
                    street1: facility_information[:address_li],
                    street2: facility_information[:address_1],
                    city: facility_information[:city],
                    state: facility_information[:state],
                    zip_code: facility_information[:zip]
                    },
                phone = facility_information[:phone],
                services = facility_information[:services_p]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: services,
                    registered_vehicle: [],
                    collected_fees: 0
                })
            co_dmv_facilities_array << facility
        end
        co_dmv_facilities_array
    end

    def ny_create_facility(source)
        ny_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:office_name],
                address = {
                    street: facility_information[:street_address_line_1],
                    city: facility_information[:city],
                    state: facility_information[:state],
                    zip_code: facility_information[:zip_code]
                    },
                phone = facility_information[:public_phone_number]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: [],
                    registered_vehicle: [],
                    collected_fees: 0
                })
            ny_dmv_facilities_array << facility
        end
        ny_dmv_facilities_array
    end

    def mo_create_facility(source)
    mo_dmv_facilities_array = []
        source.each do |facility_information|
                name = facility_information[:name],
                address = {
                    street: facility_information[:address1],
                    city: facility_information[:city],
                    state: facility_information[:state],
                    zip_code: facility_information[:zipcode]
                    },
                phone = facility_information[:phone],
                services = facility_information[:additional_license_office_info]
            
                facility = Facility.new({
                    name: name,
                    address: address,
                    phone: phone,
                    services: services,
                    registered_vehicle: [],
                    collected_fees: 0
                })
            mo_dmv_facilities_array << facility
        end
        mo_dmv_facilities_array
    end
end