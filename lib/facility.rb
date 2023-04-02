class Facility
  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(params)
    @name = params[:name]
    @address = params[:address]
    @phone = params[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include? 'Vehicle Registration'
      registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      categorize_plate(vehicle)
      calculate_fees(vehicle)
    end
  end

  def calculate_fees(vehicle)
    if vehicle.year <= (Date.today.year - 25) 
      @collected_fees += 25
    elsif vehicle.engine == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end

  def categorize_plate(vehicle)
    if vehicle.year <= (Date.today.year - 25)
      vehicle.plate_type = :antique
    elsif vehicle.engine == :ev
      vehicle.plate_type = :ev
    else
      vehicle.plate_type = :regular
    end
  end

  def check_service_written_test
    @services.include? 'Written Test'
  end

  def written_test_qualification_check(registrant)
    if registrant.age >= 16 && registrant.permit?
      true
    else
      false
    end
  end

  def administer_written_test(registrant)
    if written_test_qualification_check(registrant) && check_service_written_test
      registrant.license_data[:written] = true
      true
    else
      false
    end
  end
end
