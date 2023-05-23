require 'json'
require './lib/facility'
require './lib/dmv_data_service'

=begin
Since there are different formatting rules for each state,
these first 3 blocks will determine which state API was passed
in and call the method specific to that stae.
A more direct solution would have been to just add a second
parameter after 'facilities' in create_facilities and pass in an
argument for the state you are working with. The spirit of the
assignment seemed to encourage solving problems progamattically,
thus my chosen solution.
All addresses were formated to match those of the original
interaction patterns.
=end

class FacilityLocations
  def create_facilities(facilities)
    # This block fetches the zipcode from the first element.
    # The IF block is needed because the zipcode key is named
    # differetly across APIs.
    # I realize that there is the possibility that a state might have a
    # bad or no zipcode for the first element. I did not code for this
    # because I ran out of time. If I had another day, I would have included
    # an IF block to test for nil OR wrong-length zipcode and then
    # move to the next element.
    if facilities.first.include?(:zip_code)
      zipcode = facilities.first[:zip_code]
    else
      zipcode = facilities.first[:zipcode]
    end

# Call the appropriate method based on the state we are working with.
    location = zipcode_locator(zipcode)
    if location == "or"
      or_facilities(facilities)
    elsif location == "mo"
      mo_facilities(facilities)
    elsif location == "ny"
      ny_facilities(facilities)
    end
  end
  
  # The zipcode_locator determines which state API to use.
  def zipcode_locator(zipcode)
    zipcode = zipcode.to_i
    if zipcode.between?(97001, 97920)
      return "or"
    elsif zipcode.between?(63001, 65899)
      return "mo"
    elsif zipcode.between?(10001, 14975) || zipcode == 6390
      return "ny"
    end
  end

  ###            OREGON State Methods            ###
  def or_facilities(facilities)
    facilities.map do |facility|
      formatted_address = format_or_address(facility)
      Facility.new({
        name: facility[:title],
        address: formatted_address,
        phone: facility[:phone_number],
      })
    end
  end
  
  def format_or_address(raw_address)
    parsed = JSON.parse(raw_address[:location_1][:human_address])
    formatted = parsed.values
    if raw_address.include?(:location_2)
      parsed_2 = JSON.parse(raw_address[:location_2][:human_address])
      formatted.insert(1, parsed_2["address"])
    end
    formatted.join(" ")
  end
  
  ###            MISSOURI State Methods            ###
  def mo_facilities(facilities)
    facilities.map do |facility|
      formatted_address = format_mo_address(facility)
      formatted_phone = format_mo_phone(facility)
      Facility.new({
        name: facility[:name],
        address: formatted_address,
        phone: formatted_phone,
      })
    end
  end

  def format_mo_address(facility)
    address = []
    address.push(facility[:address1])
    address.push(facility[:city])
    address.push(facility[:state])
    address.push(facility[:zipcode])
    address.join(" ")
  end

  # I chose to include a phone number formatter to make MO numbers
  # match those of the other states.
  def format_mo_phone(facility)
    return "N/A" if facility[:phone] == nil
    raw_phone = facility[:phone]
    digits_only = raw_phone.gsub(/\D/, '')
    formatted_phone = digits_only.insert(3, '-').insert(-5, '-')
  end

  ###            NEW YORK State Methods            ###
  def ny_facilities(facilities)
    facilities.map do |facility|
      formatted_address = format_ny_address(facility)
      Facility.new({
        name: facility[:office_name],
        address: formatted_address,
        phone: "N/A",
        })
      end
    end
    
    def format_ny_address(facility)
    address = []
    address.push(facility[:street_address_line_1])
    if facility.include?(:street_address_line_2)
      address.push(facility[:street_address_line_2])
    end
    address.push(facility[:city])
    address.push(facility[:state])
    address.push(facility[:zip_code])
    address.join(" ")
  end

end