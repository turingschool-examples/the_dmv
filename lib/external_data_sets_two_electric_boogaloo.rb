class FacilityObjects
  def initialize
    @facilities_list = []
  end
  
  def create_facilities(api_data)
    api_data.each do |facility_data|
      fac_data = {
      vin: vehicle_data[:vin_1_10],
      make: vehicle_data[:make],
      model: vehicle_data[:model],
      year: vehicle_data[:model_year],
      engine: :ev,  
      }
      facility = Facility.new(fac_data)
      @facilities_list << facility
    end
    @facilities_list
  end
  
  #require 'pry';binding.pry
  
  end