class Facility

  attr_reader :name, 
              :address, 
              :phone, 
              :services, 
              :registered_vehicles,
              :collected_fees,
              :services

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def register_vehicle(data)
    if @services.include?('Vehicle Registration')
    data.registration_date = Date.today
    @registered_vehicles.push(data)
      if data.antique? 
        data.plate_type = :antique
        @collected_fees += 25
      elsif
        data.electric_vehicle? 
        data.plate_type = :ev
        @collected_fees += 200
      else
        data.plate_type = :regular
        @collected_fees += 100
      end
      @registered_vehicles
    end
  end

  def add_service(service)
    @services << service
  end

  def administer_written_test(data)
    if @services.include?('Written Test')
      if data.permit? && data.age >= 16
          data.license_data[:written] = true
      end
    end
      data.license_data[:written]
  end

  def administer_road_test(data)
    if @services.include?('Road Test')
      if data.license_data[:written] = true
          data.license_data[:license] = true
      end
    end
      data.license_data[:license]
  end
end
