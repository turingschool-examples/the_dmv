class FacilityCreator
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(json)
    if json == DmvDataService.new.or_dmv_office_locations
      json.each do |facility|
        hash = facility[:"location_1"]
        long_address = hash[:human_address]
        hash_address = JSON.load( long_address.gsub(/(?<=\")=>/, ":") )
        address = "#{hash_address["address"]} #{hash_address["city"]} #{hash_address["state"]} #{hash_address["zip"]}"

        new_facility = Facility.new({name: facility[:"title"], address: address, phone: facility[:"phone_number"]})
        @facilities << new_facility
      end
    elsif json == DmvDataService.new.ny_dmv_office_locations
      json.each do |facility|
        hours = {
                monday: "#{facility[:"monday_beginning_hours"]} to #{facility[:monday_ending_hours]}",
                tuesday: "#{facility[:"tuesday_beginning_hours"]} to #{facility[:tuesday_ending_hours]}",
                wednesday: "#{facility[:"wednesday_beginning_hours"]} to #{facility[:wednesday_ending_hours]}",
                thursday: "#{facility[:"thursday_beginning_hours"]} to #{facility[:thursday_ending_hours]}",
                friday: "#{facility[:"friday_beginning_hours"]} to #{facility[:friday_ending_hours]}"
                }
        address = "#{facility[:"street_address_line_1"]} #{facility[:"city"]} #{facility[:"state"]} #{facility[:"zip_code"]}"
        new_facility = Facility.new({ name: facility[:"office_name"], address: address, phone: facility[:"public_phone_number"], operating_hours: hours})
        @facilities << new_facility
      end
    elsif json == DmvDataService.new.mo_dmv_office_locations
      json.each do |facility|
        address = "#{facility[:"address1"]} #{facility[:"city"]} #{facility[:"state"]} #{facility[:"zipcode"]}"
        new_facility = Facility.new({name: facility[:"name"], address: address, phone: facility[:"phone"], operating_hours: facility[:"daysopen"], holidays: facility[:"holidaysclosed"], non_holiday_closures: facility[:"additionaldaysclosed"]})
        @facilities << new_facility
      end
    end
  end
end