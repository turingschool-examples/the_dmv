class Facility
  attr_reader :name, :address, :phone, :services, :r_vehicles, :total

  def initialize (information)
    @name = information[:name]
    @address = information[:address]
    @phone = information[:phone]
    @services = []
    @r_vehicles = []
    @total = 0
  end

  def add_service(service)
    @services << service
  end

  def registered_vehicles
    @r_vehicles
  end

  def collected_fees
    @total
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.registration_date = Date.today
      r_vehicles << vehicle
        if Date.today.year - vehicle.year > 25
          vehicle.plate_type = :antique 
          @total += 25
        elsif vehicle.engine == :ev
          vehicle.plate_type = :ev
          @total += 200
        else
          @total += 100
          vehicle.plate_type = :regular
        end
    else
      nil
    end
  end

  # def administer_written_test(registrant)
  #   if @services

  


end
