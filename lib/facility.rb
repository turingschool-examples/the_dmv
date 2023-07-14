class Facility
  attr_reader :name, :address, :phone

  attr_accessor :services, :registered_vehicles, :collected_fees
  def initialize(attributes)
    @name = attributes[:name]
    @address = attributes[:address]
    @phone = attributes[:phone]
    @services = []
    @registered_vehicles = []
    @collected_fees = 0
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(car)
    car.registration_date = Date.today.year

    @collected_fees += case
    when car.antique?
      car.plate_type = :antique
      25
    when car.electric_vehicle?
      car.plate_type = :ev
      200
    else
      car.plate_type = :regular
      100
    end

    @registered_vehicles << car
  end

  def administer_written_test(person)
    person.age >= 16 && person.permit && @services.include?('Written Test')
  end
end
