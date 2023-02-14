class Dataset
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def most_popular_make_model
    make = get_make(@data)
    model = get_model(@data, make)
    [make, model]
  end

  def count_by_model_year(year)
    @data.find_all{ |vehicle| vehicle.year == year.to_s }.count
  end

  def county_with_most_vehicles
    counties_count = Hash.new(0)
    @data.map { |vehicle| vehicle.county }.each { |county| counties_count[county] += 1 }
    counties_count.sort_by{ |county, number| number }.last[0]
  end

  def get_make(data)
    make_count = Hash.new(0)
    data.map { |vehicle| vehicle.make }.each { |make| make_count[make] += 1 }
    make_count.sort_by{ |make, number| number }.last[0]
  end

  def get_model(data, make)
    model_count = Hash.new(0)
    data.find_all { |vehicle| vehicle.make == make }.map { |vehicle| vehicle.model }.each { |model| model_count[model] += 1 }
    model_count.sort_by{ |model, number| number }.last[0]
  end
end
