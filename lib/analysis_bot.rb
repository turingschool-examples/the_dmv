class AnalysisBot

  
  
  def most_common_vehicle(data_set)
    makes_array = data_set.map{|hash| hash[:make]}
    makes_number_hash = Hash.new(0)
    makes_array.each {|make| makes_number_hash[make.to_sym] += 1}
    most_pop_make = makes_number_hash.sort_by{|k_v_pair| k_v_pair[-1]}.last[0].to_s
    
    models_array = data_set.select{|hash| hash[:make] == most_pop_make}
    require 'pry'; binding.pry
  end
end