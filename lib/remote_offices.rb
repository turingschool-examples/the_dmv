class RemoteOffice

  attr_reader :other_office_locations
  def initialize
    @other_offices = []
  end

  def other_office_locations(details)
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
end
  # name = office_name
  # address = street_address_line_1, street_address_line_2, city, sate, zip_code
  # phone = public_phone_number
  # I am first going to build out this code for only the ny dmv offices, but then 
  # once it is organized I want to combine it with Oregon offices
  # Using either and if, elsif, else statement 

