class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = []
  end

  def create_vehicles(vehicles)
    vehicles.map do |vehicle|
      name = vehicle[:model].downcase
      name = Vehicle.new(vehicle)
      @vehicles << name
      name
    end
  end

  def most_popular
    amounts = Hash.new(0)
    @vehicles.each do |vehicle|
      amounts["#{vehicle.make} #{vehicle.model}"] += 1
    end
    amounts.sort_by do |vehicle, number|
      number
    end.last[0]
  end

  def count_by_year
    amounts = Hash.new(0)
    @vehicles.each do |vehicle|
      amounts[vehicle.year] += 1
    end
    amounts.sort_by do |vehicle, number|
      number
    end.sort.reverse
  end

  def county_with_the_most_vehicles(data)
    county_counts = Hash.new(0)
    data.each do |vehicle|
      county_counts[vehicle[:county]] += 1
    end
    county_counts.sort_by do |county, number|
      number
    end.last
  end


end