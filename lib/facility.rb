class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees
  def initialize(info)
    # require'pry';binding.pry
    @name = info[:name]
    @address = info[:address]
    @phone = info[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0

  end

  def add_service(service)
    @services << service
  end
  
  def register_vehicle(vehicle)
    if @services.include?("Vehicle Registration")
      @registered_vehicles << vehicle
      vehicle.registration_date = Date.today
      @collected_fees += vehicle.registration_cost 
    end
  end

  def administer_written_test(registrant)
    # require'pry';binding.pry
    if @services.include?('Written Test') && registrant.age >= 16 && registrant.permit
      registrant.passed_written_test
      true
    else
      false
    end
  end


end

# require'pry';binding.pry
