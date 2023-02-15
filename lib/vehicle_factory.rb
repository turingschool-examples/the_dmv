class VehicleFactory
  attr_accessor :registration_date
  attr_reader   :vin,
                :year,
                :make,
                :model,
                :engine

  def initialize(vehicle_details, registration_date = nil, plate_type = nil)
    @vin = vehicle_details[:vin]
    @year = vehicle_details[:year]
    @make = vehicle_details[:make]
    @model = vehicle_details[:model]
    @engine = vehicle_details[:engine]
    @registration_date = registration_date
  end

  def all_electric
    @engine == :ev
  end