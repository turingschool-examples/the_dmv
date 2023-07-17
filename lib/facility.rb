class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees,
              :registration_date

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @registration_date = nil
    @collected_fees = 0
  end

  def add_services(service)
    @services << service
  end

  def collected_fees
    total_fees = 0
    registered_vehicles.each do |vehicle|
      registration_fee = calc_registration_fee(vehicle)
      total_fees += registration_fee
    end
    total_fees
  end

  def calc_registration_fee(vehicle)
    case plate_type(vehicle)
    when :antique
      25
    when :ev
      200
    else 
      100
    end
  end

  # def collected_fees
  #   if vehicle.electric_vehicle?
  #     @collected_fees += 200
  #   elsif vehicle.antique?
  #     @collected_fees += 25
  #   else
  #     @collected_fees += 100
  #   end
  # end

  def register_vehicle(vehicle)
    return if !@services.include?('Vehicle Registration')
    registration_date = Date.today
    vehicle.registration_date = registration_date
    @registered_vehicles << vehicle
  end

  def plate_type(vehicle)
    if vehicle.year <= (Date.today.year - 25)
      :antique
    elsif vehicle.engine == :ev
      :ev
    else
      :regular
    end
  end

  def administer_written_test(registrant)
    if registrant.permit? && registrant.age >= 16
    registrant.license_data[:written] = true
      true
    else 
      false
    end
  end
end
