class Facility
  attr_reader :name, :address, :phone, :services
  attr_accessor :collected_fees, :register_vehicles

  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = attributes[:services] || []
    @collected_fees = 0
    @register_vehicles = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.register
    vehicle.set_plate_type
    @register_vehicles << vehicle
  end

  def calculate_fee(vehicle)
    if vehicle.plate_type == :ev
      @collected_fees += 200
    elsif vehicle.plate_type == :antique
      @collected_fees += 25
    else
      @collected_fees += 100
    end
  end
  
  def administer_written_test(registrant)
    if @services.include?('Written Test') != true
      return 'This facility does not offer written tests.'
    elsif @services.include?('Written Test') && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true   
    elsif @services.include?('Written Test') && registrant.age < 16
      return 'Registrant is too young to take the written test.'
    end
  end

  def administer_road_test(registrant)
    if @services.include?('Road Test') && registrant.license_data[:written] = true
      registrant.license_data[:license] = true
    elsif @services.include?('Road Test') != true
      return 'This facility does not offer road tests.'
    end
  end

  def renew_drivers_license(registrant)
    if @services.include?('Renew License') && registrant.license_data[:license] = true
      registrant.license_data[:renew] = true
    elsif @services.include?('Renew License') != true
      return 'This facility does not offer road tests.'
    end
  end
end
