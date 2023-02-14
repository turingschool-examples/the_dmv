class Dataset
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def most_popular_make_model
    makes = @data.map {|vehicle| vehicle.make }
    make_count = Hash.new(0)
    makes.each {|make| make_count[make] += 1}
    make = make_count.sort_by{|make, number| number}.last[0]

    models = @data.find_all {|vehicle| vehicle.make == make }.map {|vehicle| vehicle.model }
    model_count = Hash.new(0)
    models.each {|model| model_count[model] += 1}
    model = model_count.sort_by{|model, number| number}.last[0]

    result = [make, model]
    require 'pry'; binding.pry
  end
end
