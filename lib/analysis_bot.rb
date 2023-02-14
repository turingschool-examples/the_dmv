class AnalysisBot
  
  def most_common_vehicle(data_set)
    makes_array = data_set.map{|hash| hash[:make]}
    makes_number_hash = Hash.new(0)
    makes_array.each {|make| makes_number_hash[make.to_sym] += 1}
    
    require 'pry'; binding.pry
  end
end