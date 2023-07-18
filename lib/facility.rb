class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services,
              :registered_vehicles,
              :collected_fees,
              :daily_hours

  def initialize(info)
    @name = name?(info)
    @address = address?(info)
    @phone = phone?(info)
    @daily_hours = daily_hours?(info)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def name?(info)
    if info[:dmv_office] != nil
      info[:dmv_office]
    elsif info[:office_name] != nil
      info.values_at(:office_name, :office_type).join(" ")
    else
      info[:name]
    end
  end

  def address?(info)
    if info[:address_li] != nil
      info.values_at(:address_li, :address__1, :location, :city, :state, :zip).join(' ')
    elsif info[:zip_code] != nil
      info.values_at(:street_address_line_1, :city, :state, :zip_code).join(" ")
    elsif info[:zipcode] != nil
    info.values_at(:address1, :city, :state, :zipcode).join(" ")
    else
      info[:address]
    end
  end

  def phone?(info)
    if info[:public_phone_number] != nil
      info[:public_phone_number].gsub(/[-)(\s+]/, '').insert(0, "(").insert(4, ")").insert(5, " ").insert(9, "-")
    else
      info[:phone]
    end
  end

  def daily_hours?(info)
    if info[:hours] != nil
    info[:hours]
    elsif info[:daysopen] != nil
    info[:daysopen]
    else
      days = info.values_at(:monday_beginning_hours, :tuesday_beginning_hours, :wednesday_beginning_hours, :thursday_beginning_hours,  :friday_beginning_hours, :monday_ending_hours, :tuesday_ending_hours, :wednesday_ending_hours, :thursday_ending_hours, :friday_ending_hours)
      weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
      string = []
      count = 0
      loop do
        if days[count] != nil
        string << "#{weekdays[count]} #{days[count]} to #{days[count + 5]}"
        end
        count += 1
        if count > 4
          break
        end
      end
      string.join(", ")
    end
  end


  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      if vehicle.antique?
        vehicle.plate_type = :antique
        @collected_fees += 25
      elsif vehicle.electric_vehicle?
        vehicle.plate_type = :ev
        @collected_fees += 200
      else
        vehicle.plate_type = :regular
        @collected_fees += 100
      end
      vehicle.registration_date = Date.today
      @registered_vehicles << vehicle
    end
  end

  def administer_written_test(registrant)
    if @services.include?("Written Test")
      if registrant.age > 15 && registrant.permit?
        registrant.license_data[:written] = true
      end
    end
  end

  def administer_road_test(registrant)
    if @services.include?("Road Test")
      if registrant.license_data[:written] == true
        registrant.license_data[:license] = true
      end
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?("Renew License")
      if registrant.license_data[:license] == true
        registrant.license_data[:renewed] = true
      end
    end
  end
end
