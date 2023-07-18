class VehicleFactory
  attr_reader :vehicles

  def initialize
    @vehicles = nil
  end

  def create_vehicles(vehicles)
    @vehicles = vehicles
    vehicles.map do |vehicle|
      if vehicle[:model] != nil
        name = vehicle[:model].downcase
      else
        name = vehicle[:body_type].downcase
      end
      name = Vehicle.new(vehicle)
    end
  end

  def most_popular
    amounts = Hash.new(0)
    @vehicles.each do |vehicle|
      if vehicle[:model] != nil
        amounts["#{vehicle[:make]} #{vehicle[:model]}"] += 1
      else
        amounts["#{vehicle[:make]} #{vehicle[:body_type]}"] += 1
      end
    end
    amounts.sort_by do |vehicle, number|
      number
    end.last[0]
  end

  def count_by_year
    amounts = Hash.new(0)
    @vehicles.each do |vehicle|
      amounts[vehicle[:model_year]] += 1
    end
    amounts.sort_by do |vehicle, number|
      number
    end.sort.reverse
  end

  def amount_for_year(year)
    amounts = Hash.new(0)
    @vehicles.each do |vehicle|
      amounts[vehicle[:model_year]] += 1
    end
    amounts[year]
  end

  def county_with_the_most_vehicles
    county_counts = Hash.new(0)
    @vehicles.each do |vehicle|
      county_counts[vehicle[:county]] += 1
    end
    county_counts.sort_by do |county, number|
      number
    end.last
  end
end