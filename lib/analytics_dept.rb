class AnalyticsDept
  attr_reader :current_data
  def initialize
    @current_data = nil
  end

  def get_data
    @current_data = DmvDataService.new.wa_ev_registrations
  end

  def find_popular(symbol)
    if @current_data !=nil

    else
      false
    end
  end

  def model_year_count(year)
    if @current_data !=nil

    else
      false
    end
  end

  def county_with_most_registered_vehicles
    if @current_data !=nil

    else
      false
    end
  end
end