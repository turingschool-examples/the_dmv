class AnalysisBot
  def most_common_vehicle(data_set)
    makes_array = data_set.map{|hash| hash[:make]}
    makes_number_hash = Hash.new(0)
    makes_array.each {|make| makes_number_hash[make.to_sym] += 1}
    most_pop_make = makes_number_hash.sort_by{|k_v_pair| k_v_pair.last}.last[0].to_s
    
    most_pop_make_array = data_set.select{|hash| hash[:make] == most_pop_make}
    models_array = most_pop_make_array.map{|car_hash| car_hash[:model]}
    models_number_hash = Hash.new(0)
    models_array.each {|car| models_number_hash[car.to_sym] += 1}
    most_pop_model = models_number_hash.sort_by{|k_v_pair| k_v_pair.last}.last[0]
    return "#{most_pop_make} #{most_pop_model}"
  end

  def cars_this_year(data_set, year)
    years = data_set.map{|car_hash| car_hash[:model_year]}.uniq.sort
    years_hash = Hash.new(0)
    years.each do |year| 
      data_set.each do |car|
        years_hash[year.to_sym] += 1 if car[:model_year] == year
      end
    end

    return years_hash[year.to_s.to_sym]
  end

  def county_highest_registrations(data_set, county)
    # counties = data_set.map{|car_registrations| car_registrations[:county]}.uniq
    # counties_hash = Hash.new(0)
    # counties.each do |county|
    #   data_set

    counties_hash = Hash.new(0)
    data_set.each do |car_hash|
      counties_hash[car_hash[:county]] += 1
    end
    counties_hash.sort_by{|k_v_pair| k_v_pair.last}.last[0] 
    
    return counties_hash[county]
  end
end