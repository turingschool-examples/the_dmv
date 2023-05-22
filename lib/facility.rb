class Facility
  attr_reader :name,
              :address,
              :phone,
              :services,
              :registered_vehicles,
              :collected_fees

  def initialize(facility_details)
    @name = facility_details[:name]
    @address = facility_details[:address]
    @phone = facility_details[:phone]
    @services = []
    @registered_vehicles =[]
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if @services.include?('Vehicle Registration')
      vehicle.add_registration_date(Date.today)
      vehicle.add_plate_type
      unless vehicle_registered?(vehicle)
        @registered_vehicles << vehicle
        vehicle.register
      end
    end
  end


  def collect_fees
    @registered_vehicles.each do |vehicle|
      if vehicle.plate_type == :regular
        @collected_fees += 100
      elsif vehicle.plate_type == :antique
        @collected_fees += 25
      else
        @collected_fees += 200
      end
    end
  end

  def vehicle_registered?(vehicle)
    @registered_vehicles.include?(vehicle)
  end

  def administer_written_test(registrant)
    @license_data = { written: false, license: false, renewed: false } unless defined?(@license_data)
    @license_data[:written]
  end

end

