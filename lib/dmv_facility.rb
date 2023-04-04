class DMVFacility

  # def create_facilities(database, state)
  #   if state == :OR
  #     oregon_processing(database)
  #   elsif state == :NY
  #     new_york_processing(database)
  #   elsif state == :MO
  #     missouri_processing(database)
  #   else
  #     "Apologies, no data available."
  #   end
  # end

  def create_dmvs(database)
    database.map do |data|
      dmv = Facility.new({
        name: data[:title] || data[:office_name] || data[:name],
        # require 'pry'; binding.pry
        address: eval(data[:location_1][:human_address]).fetch_values(:address, :city, :state, :zip).join(" ") || data.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(" "),
        phone: data[:phone_number]
      })
    end
  end


  # def create_dmvs_or(database)
  #   database.map do |data|
  #     address = eval(data[:location_1][:human_address])
  #     dmv = Facility.new({
  #       name: data[:title],
  #       address: address.fetch_values(:address, :city, :state, :zip).join(" "),
  #       phone: data[:phone_number]
  #     })
  #   end
  # end
  
  # def create_dmvs_ny(ny_database)
  #   ny_database.map do |ny_data|
  #     Facility.new({
  #       name: ny_data[:office_name], 
  #       address: ny_data.fetch_values(:street_address_line_1, :city, :state, :zip_code).join(" "), 
  #       phone: ny_data[:phone_number]})
  #   end
  # end

  # def create_dmvs_mo(mo_database)
  #   mo_database.map do |mo_data|
  #     Facility.new({
  #       name: mo_data[:name], 
  #       address: mo_data.fetch_values(:address1, :city, :state, :zipcode).join(" "), 
  #       phone: mo_data[:phone_number]})
  #   end
  # end


end


