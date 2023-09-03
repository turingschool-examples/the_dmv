class VehicleFactory
  def initalize
  end
  
  def create_vehicle(registrations)
    @create_vehicle = []
    registrations.map do |registration|
      # registration.transform_keys(:vin_1_10 vin:)
      #  :model_year year:)
      # binding.pry
      # binding.pry
      vehicle = Vehicle.new(registration)
      @create_vehicle << vehicle
    end
  end
end