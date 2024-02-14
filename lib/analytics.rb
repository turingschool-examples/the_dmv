class Analytics
  attr_reader :dmv_data_service

  def initialize()
    @dmv_data_service = DmvDataService.new
  end

  def most_popular_car
    popular_vehicles = []
    factory = VehicleFactory.new
    registration = dmv_data_service.wa_ev_registrations
    all_vehicles = factory.create_vehicles(registration)
    specific_vehicles = all_vehicles.map do |vehicle|
      vehicle.make + " " + vehicle.model
    end
    specific_vehicles.group_by(&:itself).values.max_by(&:size).first
  end


end
