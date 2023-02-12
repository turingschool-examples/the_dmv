class RemoteOffice

  attr_reader :other_office_locations
  def initialize
    @other_offices = []
  end

  def or_office_locations(details)
    or_dmv_office_locations = DmvDataService.new.or_dmv_office_locations
      or_dmv_office_locations.each do |office|
        details = {
          name: office[:title],
          address: office[:human_address],
          phone: office[:phone_number],
          }
        @other_offices << (offices = Facility.new(details))
    end
    @other_offices
  end

  def ny_office_locations(details)
    ny_office_locations = DmvDataService.new.ny_dmv_office_locations
      ny_office_locations.each do |office|
        details = {
          name: office[:office_name],
          address: "#{office[:street_address_line_1]}, #{office[:street_address_line_2]}, #{office[:city]}, #{office[:state]}, #{office[:zip_code]}",
          phone: office[:public_phone_number]
        }
        @other_offices << (offices = Facility.new(details))
    end
    @other_offices  
  end

  def mo_office_locations(details)
    mo_office_locations = DmvDataService.new.mo_dmv_office_locations
      mo_office_locations.each do |office|
        details = {
          name: office[:name],
          address: "#{office[:address1]}, #{office[:city]}, #{office[:state]}, #{office[:zip_code]}",
          phone: office[:phone]
        }
        @other_offices << (offices = Facility.new(details))
    end
    @other_offices  
  end
end

# Sonow I want all of these data bases to be able to run together
# how?
#