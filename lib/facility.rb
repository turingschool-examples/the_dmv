class Facility
  attr_reader :name, :address, :phone, :services, :registered_vehicles, :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      vehicle.register_now
      issue_plate_fees(vehicle)
      @registered_vehicles << vehicle
    end
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(person)
    if @services.include?("Written Test") && person.permit && person.age >= 16
      person.pass_test(:written)
      true
    else
      false
    end
  end

  def administer_road_test(person)
    if @services.include?("Road Test") && person.license_data[:written]
      person.pass_test(:license)
      true
    else
      false
    end
  end

  def renew_drivers_license(person)
    if @services.include?("Renew License") && person.license_data[:license]
      person.pass_test(:renewed)
      true
    else
      false
    end
  end
      

  #helper UNTESTED
  def issue_plate_fees(vehicle)
    if vehicle.antique?
      vehicle.issue_plate(:antique)
      @collected_fees += 25
    elsif vehicle.electric_vehicle?
      vehicle.issue_plate(:ev)
      @collected_fees += 200
    else
      vehicle.issue_plate(:regular)
      @collected_fees += 100
    end
  end

  #multiple data adjustments
  def name_finder(facility_details)
    if facility_details[:name]
      facility_details[:name]
    end
  end

  def 



    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0






end
