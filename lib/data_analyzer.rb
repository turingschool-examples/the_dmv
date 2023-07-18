class DataAnalyzer
  attr_reader :data

  def initialize(data)
    @data = data
  end

  def descending_model_list
    grouped_list = data.group_by { |vehicle| vehicle[:model] }
    counted_list = grouped_list.transform_values { |type| type.count }
    ordered_list = counted_list.sort_by { |model, count| -count }
  end

  def most_model
    descending_model_list[0][0]
  end
  
  def descending_make_list
    grouped_list = data.group_by { |vehicle| vehicle[:make] }
    counted_list = grouped_list.transform_values { |type| type.count }
    ordered_list = counted_list.sort_by { |make, count| -count }
  end
  
  def most_make
    descending_make_list[0][0]
  end

  def model_year_count(year)
    list = data.find_all { |vehicle| vehicle[:model_year] == year }
    list.count
  end

  def descending_county_list
    grouped_list = data.group_by { |vehicle| vehicle[:county] }
    counted_list = grouped_list.transform_values { |type| type.count }
    ordered_list = counted_list.sort_by { |make, count| -count }
  end

  def most_registered_county
    descending_county_list[0][0]
  end

  def daily_hours
    if data.any? { |location| location[:state] == "CO" }
      list = {}
      data.each { |location| list[location[:dmv_office]] = location[:hours] }
      list
    # elsif data.any? { |location| location[:state] == "NY" }
    #   list = {}
    #   data.each { |location| list[location[:office_name]] = location[:hours] }
    #   list
    end
  end
end
