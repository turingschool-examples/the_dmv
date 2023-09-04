class AnalyticsDept
  attr_reader :current_data
  def initialize
    @current_data = nil
  end

  def get_data
    factory = Factory.new
    @current_data = factory.create_vehicles(DmvDataService.new.wa_ev_registrations)
  end

  def find_popular(symbol)
    if @current_data !=nil
      symbol_array = @current_data.map { |vehicle| vehicle.send(symbol)}
      frequency_hash = Hash.new(0)
      symbol_array.each { |vehicle_symbol| frequency_hash[vehicle_symbol] += 1 }
      frequency_hash.sort_by { |vehicle_symbol, number| number}.last[0]
    else
      false
    end
  end

  def model_year_count(year)
    if @current_data !=nil
      year_array = @current_data.map { |vehicle| vehicle.year}
      year_array.count(year)
    else
      false
    end
  end

  def county_with_most_registered_vehicles
    if @current_data !=nil
      county_array = @current_data.map { |vehicle| vehicle.county}
      frequency_hash = Hash.new(0)
      county_array.each { |vehicle_county| frequency_hash[vehicle_county] += 1 }
      frequency_hash.sort_by { |vehicle_county, number| number}.last[0]
    else
      false
    end
  end
end