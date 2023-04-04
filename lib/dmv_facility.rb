class DMVFacility

    def create_facilities(database)
      require 'pry'; binding.pry
      return create_dmvs_or(database) if database[0][:website].include?("oregon")

      return create_dmvs_mo(database) if database[0][:city] == "ST LOUIS"
      return create_dmvs_ny(database) if database[0][:state] == "NY" 

      #   # create_dmvs_or(database)
      # elsif database[0][:state] == "NY"
      #   create_dmvs_ny(database)
      # else database[0][:state] == "MO"
      #     create_dmvs_mo(database)
      # end
    end

    # def format_address(address)
    #   address = eval(data[:location_1][:human_address])
    #   address.fetch_values(:address, :city, :state, :zip).join(" ")
    # end
    
    # def format_facility_data(facility)
    #   # data = {
    #   #   name: format_name(facility),
    #   #   address: format_address(facility)
        
    #   # }
      
    # end
  # def create_dmvs(database)
  #   #if can pull out state for each, can then decide which helper method to run? 
  #   address = eval(database[0][:location_1][:human_address])
  #   create_dmvs_or(database) if address[:state] == "OR"
  #   require 'pry'; binding.pry
  #   if state == :OR
  #     create_dmvs_or(database)
  #   elsif state == :NY
  #     create_dmvs_ny(database)
  #   elsif state == :MO
  #     create_dmvs_mo(database)
  #   else
  #     "Apologies, no data available."
  #   end
  # end

  # def create_dmvs(database)
  #   database.map do |data|
  #     dmv = Facility.new({
  #       name: data[:title] || data[:office_name] || data[:name],
  #       # require 'pry'; binding.pry
  #       address: eval(data[:location_1][:human_address]).fetch_values(:address, :city, :state, :zip).join(" ") || data.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(" "),
  #       phone: data[:phone_number]
  #     })
  #   end
  # end


  def create_dmvs_or(database)
    database.map do |data|
      address = eval(data[:location_1][:human_address])
      dmv = Facility.new({
        name: data[:title],
        address: address.fetch_values(:address, :city, :state, :zip).join(" "),
        phone: data[:phone_number]
      })
    end
  end
  
  def create_dmvs_ny(ny_database)
    ny_database.map do |ny_data|
      # require 'pry'; binding.pry
      phone_number = ny_data[:public_phone_number].insert(3, "-").insert(7, "-") unless ny_data[:public_phone_number] == nil
      Facility.new({
        name: ny_data[:office_name], 
        address: ny_data.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(" "), 
        phone: phone_number
      })
    end
  end

  def create_dmvs_mo(mo_database)
    mo_database.map do |mo_data|
      Facility.new({
        name: mo_data[:name], 
        address: mo_data.fetch_values(:address1, :city, :state, :zipcode).join(" "), 
        phone: mo_data[:phone]})
    end
  end

  # def format_facility_data(facility)
  #   data = {
  #     name: format_name(facility)
  #     address: format_address(facility)

  #   }
  # end

end


