class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees,
              :registration_date

  def initialize(facility_data)
    @name = facility_data[:name]
    @address = facility_data[:address]
    @phone = facility_data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
#need to find how to change registration_date of @cruz with facility #register_vehicle.
    # vehicle.registration_date = Date.today
#need to modify collected fees my plate type of vehicle
    collected_fees += plate_type fee
    @registered_vehicles << vehicle
    #Untested
    register_vehicle.last.[registration_date] = Date.today
    #I think moving vehicle into registered_vehicles will let me change it's attr...maybe
    #but it's not the actual instance of the class that's passed in
  end

  def administer_written_test(registrant)
#need to work on boolean logic sequencing to reduce code
    if @services.include("Written Test") && registrant.permit? && registrant.age >= 16
      registrant.license_data[:written] = true
    elsif registrant.permit? == false
      false

  end

  def administer_road_test(registrant)
    if 
  end

  def renew_drivers_license(registrant)

  end
end
