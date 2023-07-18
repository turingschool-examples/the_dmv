class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees,
              :open_hours

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
    @open_hours = facility_details[:open_hours]
  end

  def add_service(service)
    @services << service
  end

  def registar_vehicle(car)
    if @services.include?("Vehicle Registration")
      if (Date.today.year - car.year) > 25
        car.plate_type = :antique
        @collected_fees += 25
      elsif car.engine == :ev
        car.plate_type = :ev
        @collected_fees += 200
      else
        car.plate_type = :regular
        @collected_fees += 100
      end
      car.registration_date = Date.today
      @registered_vehicles << car
    end
  end

  def administer_written_test(registar)
    if @services.include?("Written Test") && registar.permit && registar.age > 15
      registar.license_data[:written] = true
      true
    else
      false
    end
  end

  def administer_road_test(registar)
    if @services.include?("Road Test") && registar.permit && registar.age > 15
      registar.license_data[:license] = true
      true
    else
      false
    end
  end

  def renew_drivers_license(registar)
    if @services.include?("Renew License") && registar.permit && registar.age > 15
      registar.license_data[:renewed] = true
      true
    else
      false
    end
  end

  def most_popular_registered_make
    make_count = Hash.new(0)
    @registered_vehicles.each do |car| 
      make_count[car.make] += 1
    end
    make_count.sort_by do |make,number| 
      number
    end.last[0]
  end

  def most_popular_registered_model
    model_count = Hash.new(0)
    @registered_vehicles.each do |car| 
      model_count[car.model] += 1
    end
    model_count.sort_by do |model,number| 
      number
    end.last[0]
  end
end
