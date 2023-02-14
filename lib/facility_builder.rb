require 'json'

class FacilityBuilder

attr_reader :state_facility_list

  def create_facilities(facility_data)
    @state_facility_list = []
    if facility_data[0].keys.include?(:zip_code)
      if facility_data[0][:zip_code].start_with?("9")
        for i in 0..facility_data.count - 1
          current_hash = facility_data[i]
          facility_hash = {name: current_hash[:title],
                          address: or_address_cleaner(current_hash[:location_1][:human_address]),
                          phone: current_hash[:phone_number]}
                          @state_facility_list << facility_hash
                        end
                      elsif facility_data[0][:zip_code].start_with?("1") 
                        for i in 0..facility_data.count - 1
                          current_hash = facility_data[i]
                          facility_hash = {name: current_hash[:office_name],
                          address: ny_address_cleaner(current_hash),
                          phone: current_hash[:public_phone_number],
                          daily_hours: ny_hours_cleaner(current_hash)}
                          @state_facility_list << facility_hash
                        end
                      end
                    else
                      for i in 0..facility_data.count - 1
                        current_hash = facility_data[i]
                        facility_hash = {name: current_hash[:name],
                        address: mo_address_cleaner(current_hash),
                        phone: current_hash[:phone],
                        daily_hours: current_hash[:daysopen]}
                        @state_facility_list << facility_hash
                      end
                      
    end
    @state_facility_list
  end

  def or_address_cleaner(ugly_address)
    "#{JSON.parse(ugly_address)["address"]} #{JSON.parse(ugly_address)["city"]}, #{JSON.parse(ugly_address)["state"]} #{JSON.parse(ugly_address)["zip"]}"
  end

  def ny_address_cleaner(this_hash)
    "#{this_hash[:street_address_line_1]} #{this_hash[:city]}, #{this_hash[:state]} #{this_hash[:zip_code]}"
  end

  def mo_address_cleaner(this_hash)
    "#{this_hash[:address1]} #{this_hash[:city].rstrip}, #{this_hash[:state]} #{this_hash[:zipcode]}"
  end

  def ny_hours_cleaner(this_hash)
    clean_hours = ["Monday: #{this_hash[:monday_beginning_hours]} - #{this_hash[:monday_ending_hours]}",
                   "Tuesday: #{this_hash[:tuesday_beginning_hours]} - #{this_hash[:tuesday_ending_hours]}",
                   "Wednesday: #{this_hash[:wednesday_beginning_hours]} - #{this_hash[:wednesday_ending_hours]}",
                   "Thursday: #{this_hash[:thursday_beginning_hours]} - #{this_hash[:thursday_ending_hours]}",
                   "Friday: #{this_hash[:friday_beginning_hours]} - #{this_hash[:friday_ending_hours]}"]
    clean_hours.join(" ")
  end
end