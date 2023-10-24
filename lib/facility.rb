class Facility
  attr_reader :name,
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    @registered_vehicles << vehicle
    vehicle.new_registration_date

    if vehicle.plate_type == :antique
      @collected_fees += 25
    elsif vehicle.plate_type == :ev
      @collected_fees += 200
    else
      @collected_fees += 100
    end
  end 

  # def collected_fees
  #   @collected_fees << collected_fees
  #   if vehicle.plate_type == :antique
  #     @collected_fees = 25
      
  # require 'pry'; binding.pry
  #   end
  # end
end
