class AnalysisBot
  
  
  
  def most_common_vehicle(data_set)
    models = data_set.map{|hash| hash[:model]}.uniq
    require 'pry'; binding.pry
  end
end