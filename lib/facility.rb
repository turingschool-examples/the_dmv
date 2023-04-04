class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collect_fees
              
  def initialize(facility)
    @name = facility[:name]
    @address = facility[:address]
    @phone = facility[:phone]
    @services = []
    @registered_vehicles = []
    @collect_fees = 0

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @servies.include('Vehicle Registration')
      collect_fees(vehicle)
      vehicle.registration_date == Date.today
      plate_type(vehicle)
      @registered_vehicles << vehicle
  end

  def collect_fees
    if vehicle.antique?
      @collect_fees += $25
    elsif vehicle.electric_vehicle?
      @collect_fees += $200
    else
      @collect_fees += $100
     end
  end
end
