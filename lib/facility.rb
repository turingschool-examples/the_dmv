class Facility
  attr_reader :name, :address, :phone, :services, :collected_fees, :registered_vehicles
  attr_writer :collected_fees


  def initialize(facility_info)
    @name = facility_info.fetch(:name)
    @address = facility_info.fetch(:address)
    @phone = facility_info.fetch(:phone)
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration') == true
      vehicle.registration_date = Date.today
      @collected_fees =+ 100
      @registered_vehicles << vehicle
    end
  end

  def accept_fees(int)
    @collected_fees += (int)
  end

  def administer_written_test(registrant)
    if @services.include?('Written Test') == true && registrant.permit == true && registrant.age >= 16
      return registrant.license_data[:written] = true
    else
      false
    end
    
  end





end


# def pay_fee
#   if vehicle.vehicle_details[:year] == Date.today.year - @year > 25
#     @collected_fees += 25
#   elsif vehicle.vehicle_details[:engine] == :ev
#     @collected_fees += 200
#   else 
#     @collected_fees +=100
#   end
# end
  # def plate_type
  #   if self.registration_date != nil && Date.today.year - self.year > 25
  #     return self.plate_type == :antique
  #   elsif self.registration_date != nil && self.engine == :ev
  #     return self.plate_type == :ev
  #   elsif self.registration_date != nil
  #     return self.plate_type == :regular
  #   else
  #     nil
  #   end
  # end
  # def plate_type
  #   if vehicle.registration_date != nil && Date.today.year - vehicle.year > 25
  #     return vehicle.plate_type == :antique
  #   elsif vehicle.registration_date != nil && vehicle.engine == :ev
  #     return vehicle.plate_type == :ev
  #   elsif vehicle.registration_date != nil
  #     return vehicle.plate_type == :regular
  #   else
  #     nil
  #   end
  # end


# end
