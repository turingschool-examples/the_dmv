class DmvFacility
  def create_facilities(databases)
    datum = databases.map do |data|
      Facility.new({
        name: access_name(data),
        address: access_address(data),
        phone: access_phone(data),
      })
    end
  end

  # require 'pry'; binding.pry
  def access_name(datum)
    datum[:title]
  end

  def access_address(datum)
    datum.include?("oregon")
      address_data = eval(datums[:location_1][:human_address])
      address = address_data.fetch_values(:address, :city, :state, :zip).join(" ")
    end

  def access_phone(data)
    data.include?("oregon")
    data[:phone_number]
  end
end
# The point of the create facilities method is to have a framework that will allow helper methods, namely "access_name", "access_address", and "access_phone" to be called that can adapt to recognize various keys in multiple states and return values from one symbol per data type. Using these helper methods, I would be able to adapt keynames to be recognized by the framework.
