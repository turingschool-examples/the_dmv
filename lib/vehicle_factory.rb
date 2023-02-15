class VehicleFactory
  attr_reader :vehicles
  def initialize
    @vehicles = []
  end

  def create_vehicles(data)
    data.each do |car|
      vehicle_details = {
        make: car[:make],
        model: car[:model],
        vin: car[:vin_1_10] += car[:dol_vehicle_id],
        year: car[:model_year].to_i,
        county: car[:county],
        engine: :ev
      }
      @vehicles << Vehicle.new(vehicle_details)
    end
    @vehicles.uniq! {|vehicle| vehicle.vin}
    @vehicles
  end

  def most_pop_make
    grouped = @vehicles.group_by { |vehicle| vehicle.make }
    grouped.each { |key, value| grouped[key] = value.length }
    ans = grouped.max_by { |key, value| value }
    ans[0]
  end

  def most_pop_model
    grouped = @vehicles.group_by { |vehicle| vehicle.model }
    grouped.each { |key, value| grouped[key] = value.length }
    ans = grouped.max_by { |key, value| value }
    ans[0]
  end

  def registrations_per_model_year(year)
    grouped = @vehicles.group_by { |vehicle| vehicle.year }
    grouped[year].length
  end

  def most_reg_county
    grouped = @vehicles.group_by { |vehicle| vehicle.county }
    grouped.each { |key, value| grouped[key] = value.length }
    ans = grouped.max_by { |key, value| value }
    ans[0]
  end
end