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
    if data[0][:state] == "CO"
      data.map do |site|
        details = {
          name: site[:dmv_office],
          address: site[:address_li],
          hours: site[:hours]
        }
        end
    elsif data[0][:state] == "NY"
      data.map do |site|
        details = {
          name: "DMV " + site[:office_name].split.map(&:capitalize).join(" "),
          address: site[:street_address_line_1].split.map(&:capitalize).join(" "),
          hours: {
            Monday: {
              open: site[:monday_beginning_hours],
              close: site[:monday_ending_hours]
            },
            Tuesday: {
              open: site[:tuesday_beginning_hours],
              close: site[:tuesday_ending_hours]
            },
            Wednesday: {
              open: site[:wednesday_beginning_hours],
              close: site[:wednesday_ending_hours]
            },
            Thursday: {
              open: site[:thursday_beginning_hours],
              close: site[:thursday_ending_hours]
            },
            Friday: {
              open: site[:friday_beginning_hours],
              close: site[:friday_ending_hours]
            },
            Saturday: {
              open: site[:saturday_beginning_hours],
              close: site[:saturday_ending_hours]
            },
            Sunday: {
              open: site[:sunday_beginning_hours],
              close: site[:sunday_ending_hours]
            }
          }
        }
      end
    elsif data[0][:state] == "MO"
      data.map do |site|
        details = {
          name: "DMV " + site[:name].split.map(&:capitalize).join(" "),
          address: site[:address1].split.map(&:capitalize).join(" "),
          hours: site[:daysopen],
          holidaysclosed: site[:holidaysclosed]
        }
      end
    end
  end
end