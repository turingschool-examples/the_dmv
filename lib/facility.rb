class Facility
  attr_accessor :name, :address, :phone, :services, :registration_date, :registered_vehicles, :collected_fees, :plate_type

  def initialize(info)
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def registration_date
    nil
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    vehicle.registration_date = Date.today
    @registered_vehicles << vehicle
  end

  def collected_fees

    fees = 0
    @registered_vehicles.each do |vehicle|
      case vehicle.plate_type
      when :antique
      end