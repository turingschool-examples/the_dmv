class FacilityFactory

  def create_facilities(vehicles)
    vehicles.map do |vehicle|
      name = vehicle[:model].downcase
      name = Vehicle.new(vehicle)
    end
  end

end