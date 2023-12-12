require './lib/vehicle'
require './lib/registrant'
require './lib/dmv_data_service'

class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees, :operating_hours, :holiday_closures

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @operating_hours = info[:operating_hours] || {}
    @holiday_closures = info[:holiday_closures] || []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today
      vehicle.plate_type = set_plate_type(vehicle)
      @registered_vehicles << vehicle
      @collected_fees += vehicle.registration_fee(vehicle)

      # it will return this
      @registered_vehicles
    else
      nil
    end
  end

  def set_plate_type(vehicle)
    # vehicle.plate_type = plate_type
    if vehicle.antique?
      vehicle.plate_type = :antique

    elsif vehicle.electric_vehicle?
      vehicle.plate_type = :ev

    else
      vehicle.plate_type = :regular
    end
  end

  def calculate_registration_fee(vehicle)
    return 25 if vehicle.antique?
    return 200 if vehicle.electric_vehicle?
    100
  end

  def administer_written_test(registrant)

    if @services.include?('Written Test') && registrant.permit?
      registrant.license_data[:written] = true
    else
      false
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written]
      registrant.license_data[:license] = true
    else
      false
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license]
      registrant.license_data[:renewed] = true
    else
      false
    end
  end

  def state_facility(state_info)

    if state_info.key?(:ny_name)
      { name: state_info[:ny_name], address: state_info[:ny_address], phone: state_info[:ny_phone] }

    elsif state_info.key?(:mo_name)
      { name: state_info[:mo_name], address: state_info[:mo_address], phone: state_info[:mo_phone] }

    else
      state_info
    end
  end

  def add_operating_hours(day, hours)
    @operating_hours[day] = hours
  end

  def add_holiday_closure(holiday)
    @holiday_closures << holiday unless @holiday_closures.include?(holiday)
  end

  def open_on_day?(day)
    @operating_hours.key?(day)
  end

  def closed_on_holiday?(holiday)
    @holiday_closures.include?(holiday)
  end
end
