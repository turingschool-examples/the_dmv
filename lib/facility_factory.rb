require './lib/facility'

class FacilityFactory
  def create_facilities(data, name_key, address_key, phone_key, hour_key=nil)
    data.map do |facility_data|
      daily_hours =
        if hour_key
          facility_data[hour_key]
        else
          daily_hours_ny(facility_data)
        end
      Facility.new( {
        name: facility_data[name_key],
        address: facility_data[address_key],
        phone: facility_data[phone_key],
        daily_hours: daily_hours
        }
      )
    end
  end

  def daily_hours_ny(facility_data)
    schedule= {
                :M=>"#{facility_data[:monday_beginning_hours]}-#{facility_data[:monday_ending_hours]}",
                :T=>"#{facility_data[:tuesday_beginning_hours]}-#{facility_data[:tuesday_ending_hours]}",
                :W=>"#{facility_data[:wednesday_beginning_hours]}-#{facility_data[:wednesday_ending_hours]}",
                :Th=>"#{facility_data[:thursday_beginning_hours]}-#{facility_data[:thursday_ending_hours]}",
                :F=>"#{facility_data[:friday_beginning_hours]}-#{facility_data[:friday_ending_hours]}"
              }

    if facility_data.key?(:saturday_beginning_hours) && facility_data.key?(:saturday_ending_hours)
      schedule[:SAT] = "#{facility_data[:saturday_beginning_hours]}-#{facility_data[:saturday_ending_hours]}"
    end

    if facility_data[:saturday_beginning_hours] = "CLOSED" && facility_data[:saturday_ending_hours] == "CLOSED"
      schedule[:SAT] = "CLOSED"
    end

    grouped_schedule = Hash.new([])
    schedule.each do |day, hour|
      grouped_schedule[hour] = grouped_schedule[hour] + [day]
    end
    grouped_schedule.map { |hours, days| "#{days.join(', ')}: #{hours}"}
  end


end
