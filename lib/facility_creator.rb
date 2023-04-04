class FacilityCreator
  attr_reader :facilities
  def initialize
    @facilities = []
  end

  def create_facilities(data)
    if data == DmvDataService.new.or_dmv_office_locations
      oregon_facility_creator(data)
    elsif data == DmvDataService.new.ny_dmv_office_locations
      new_york_facility_creator(data)
    elsif data == DmvDataService.new.mo_dmv_office_locations
      missouri_facility_creator(data)
    end
  end

  def oregon_facility_creator(data)
    @facilities = data.map do |facility|
      address = JSON.parse(facility[:location_1][:human_address]).values.join(" ")
      Facility.new({ name: facility[:"title"], address: address, phone: facility[:"phone_number"] })
    end
  end

  def new_york_facility_creator(data)
    @facilities = data.map do |facility|
      hours = {
        monday: "#{facility[:"monday_beginning_hours"]} to #{facility[:monday_ending_hours]}",
        tuesday: "#{facility[:"tuesday_beginning_hours"]} to #{facility[:tuesday_ending_hours]}",
        wednesday: "#{facility[:"wednesday_beginning_hours"]} to #{facility[:wednesday_ending_hours]}",
        thursday: "#{facility[:"thursday_beginning_hours"]} to #{facility[:thursday_ending_hours]}",
        friday: "#{facility[:"friday_beginning_hours"]} to #{facility[:friday_ending_hours]}"
        }
      address = "#{ facility[:"street_address_line_1"] } #{ facility[:"city"] } #{ facility[:"state"] } #{ facility[:"zip_code"] }"
      Facility.new({ name: facility[:"office_name"], address: address, phone: facility[:"public_phone_number"], operating_hours: hours })
    end
  end

  def missouri_facility_creator(data)
    @facilities = data.map do |facility|
      address = "#{facility[:"address1"]} #{facility[:"city"]} #{facility[:"state"]} #{facility[:"zipcode"]}"
      Facility.new({name: facility[:"name"], address: address, phone: facility[:"phone"], operating_hours: facility[:"daysopen"], holidays: facility[:"holidaysclosed"], non_holiday_closures: facility[:"additionaldaysclosed"]})
    end
  end
end