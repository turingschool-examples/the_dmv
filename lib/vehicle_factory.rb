class VehicleFactory
  def initialize
    
  end

  def create_vehicles(dmv)
    dmv.map do |car|
      Vehicle.new({
        engine: :ev,
        make:  car[:make],
        model: car[:model],
        vin: car[:vin_1_10],
        year: car[:model_year]
        })
    end
  end

  def most_popular(dmv)
   dmv.group_by { |car| car[:make] }.max_by { |make, brand| brand.count }.first
  end

  def least_popular(dmv)
    dmv.group_by { |car| car[:make] }.min_by { |make, brand| brand.count }.first
  end

  def count_model_year(dmv)
   dmv.group_by { |car| car[:model_year] }.transform_values { |car| car.count }
  end

  def most_registered_county(dmv)
    dmv.group_by { |car| car[:county] }.max_by { |name, car| car.count }.first
  end

  def registered_by_make(dmv)
    dmv.group_by { |car| car[:make] }.transform_values { |car| car.count }
  end
end