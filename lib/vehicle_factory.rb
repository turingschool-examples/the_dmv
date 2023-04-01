class VehicleFactory
  def initialize
    
  end

  def create_vehicles(dmv)
    new_cars = []
    dmv.each do |car|
      new_cars << Vehicle.new(
      engine: :ev,
      make:  car[:make],
      model: car[:model],
      vin: car[:vin_1_10],
      year: car[:model_year]
      )
    end
    new_cars
  end

  def most_popular(dmv)
   dmv.group_by { |car| car[:make] }.max_by { |make, brand| brand.count }.first
  end

  def count_model_year(dmv)
   model_year = dmv.group_by { |car| car[:model_year] }.transform_values { |car| car.count }
  end
end