class FacilityFactory
  def initialize

  end
    # I can't recall exactly, but that could work if you use the proper hash key 
    # formatting (instead of thinking it as renaming the unique keys, think of it 
    # as assigning a new value to the keys you already set up)

      # def address_helper

      # :dmv_office
      # :office_name
      # :name
      # :phone
      # :public_phone_number
      # :phone
      # :address_li
      # :address_1
      # :city
      # :state
      # :zip

      # :street_address_line_1
      # :city
      # :state
      # :zip_code

      # :address1
      # :city
      # :state
      # :zipcode

  def create_facilities(facility_database)

    # Looks like I'm gonna have to have to do some conditional stuff
      # for the NY data set to work
    # Maybe I do something where I ask if it == nil? then use the other one

    facility_database.map do |potential_facility|
      facility_deets = {}


      facility_deets[:name] = potential_facility[:dmv_office]
      

      facility_deets[:phone] = potential_facility[:phone]


      facility_deets[:address] = "#{potential_facility[:address_li]} " \
                                  "#{potential_facility[:address__1]} " \
                                  "#{potential_facility[:city]} " \
                                  "#{potential_facility[:state]} " \
                                  "#{potential_facility[:zip]}" 
                                  
      facility_deets[:services] = potential_facility[:services_p]

      Facility.new(facility_deets)
    end

  end
end