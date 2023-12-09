class FacilityMaker

    attr_reader :new_facilities, :new_facility_data

    def initialize(dmv_data)
        @dmv_data = dmv_data
        @new_facilities = []
        @new_facility_data = {}
    end
# We will be pulling something that starts as an array
  # within the array, we have a hash (with a nested hash, but I don't believe
  # we will need anything from the nested hash)
# some key info that we will need to grab for our own facilities being made
# are the following
  # :dmv_office will be name
  # :address_li ,:address__1, :city, :state, :zip will be all parts of the address
  # :phone will be phone
  # :hours will give all hours of the facility if needed
  # :services_p will be all services available at that facility

  # need to get a hash that has :name, :address, :phone
    # we will use this hash to pass in the data needed for facility.new
    # then we need a way to also pull in the services data and update the new facility that is created so it holds the correct services

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
end

