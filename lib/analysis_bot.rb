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
end