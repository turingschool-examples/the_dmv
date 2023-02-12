class VehicleFactory
  
  def initialize
  end

  def create_vehicles(data_type)
   dmv_data = DmvDataService.new.send(data_type)
  end
end