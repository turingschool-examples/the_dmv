class FacilityFactory

  def create_facilities(office_locations)
    office_locations.map do |office_location|
      office_location[:name] = office_location[:dmv_office]
      office_location[:address] = office_location[:address_li]
      Facility.new(office_location)
    end
  end

  # def concatenate_address

  # end

end

#I want the key office_location[:address] = 
#[:address_li] + [:address__1] + [:city] + [:state] + [:zip]

#I'm inside the enumerable, iterating each hash
#look at the key value pairs [:address_li] and return 

#i feel like I need a helper method to concatenate

# address_values = [
#   office_locations[:address_li],
#   office_locations[:address__1],
#   office_locations[:city],
#   office_locations[:state],
#   office_locations[:zip]
# ]

# concatenated_address = address_values.join(' ')

#OR 
#office_location[:address] = office_locations.values_at(:address_li, :address__1, :city, :state, :zip).join(' ')
