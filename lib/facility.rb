require "./lib/vehicle.rb"

class Facility
  attr_reader :name, :address, :phone, :services

  def initialize(data)
    @name = data[:name]
    @address = data[:address]
    @phone = data[:phone]
    @services = []
  end

  def add_service(service)
    @services << service
  end

  def register_vehicle(vehicle)
    if vehicle.antique? == true
      registration_fee = 25
      @plate_type = [:antique] #how to add this to the hash?
      require 'pry';binding.pry
    elsif vehicle.electric_vehicle? == true
      registration_fee = 200
      @plate_type = [:ev]
    else 
      registration_fee = 100
      @plate_type = [:regular]
    end
  end
    # vehicles 25+ are antique and cost 25$ to register
    # electric vehicles (EV) cost 200 to register
    # all others cost 100
    # a vehicle's plate_type should be set to :regular, :antique, or :ev upon successful registration

    # will likely need to add a value to change the @registration_date later

end