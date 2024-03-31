class VehicleFactory
  def initialize
  end

  def create_vehicles(registrations)
    registrations.map do |hash|
      hash[:year] = hash.delete :model_year
      hash[:vin] = hash.delete :vin_1_10
      hash[:engine] = :ev
      Vehicle.new(hash)
    end
  end
end