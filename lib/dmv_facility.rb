class DmvFacility

  def create_facility_or(offices)
   offices.map do |office|
      Facility.new ({
                  name: office['title'],
                  address: office[:location_1][:human_address],
                  phone: office['phone_number']
                })
    end
  end

  def create_facility_ny(offices)
    offices.map do |office|
      Facility.new ({
                  name: office['office_name'],
                  address: office[:'street_address_line_1'],
                  phone: office['public_phone_number']
                })
    end
  end

  #not sure if this actually returns the address the way it should. I couldn't figure out how to print it or view it in pry.
  def create_facility_mo(offices)
    offices.map do |office|
      Facility.new ({
                  name: office[:name],
                  address: office[:address1, :city, :state, :zip],
                  phone: office[:phone]
                })
    end
  end
end
