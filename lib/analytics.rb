class Analytics
  attr_reader :source

  def initialize(source)
    @source = source
  end

  def most_popular_make_model
    "#{most_popular_make} #{most_popular_model}"
  end

  def most_popular_make
    make_and_count = Hash.new(0)
    @source.each{|car| make_and_count[car[:make]] += 1}
    make_and_count.sort_by{|make, count| count}.last[0]
  end

  def most_popular_model
    model_and_count = Hash.new(0)
    @source.select{|car| car[:make] == most_popular_make}.
    each{|car| model_and_count[car[:model]] += 1}
    model_and_count.sort_by{|model, count| count}.last[0]
  end

  def vehicles_per_model_year(year)
    @source.select{|car| car[:model_year] == year}.count
  end

  def county_with_most_vehicles
    cars_by_county = Hash.new(0)
    @source.each{|car| cars_by_county[car[:county]] += 1}
    cars_by_county.sort_by{|county, count| count}.last[0]
  end
end