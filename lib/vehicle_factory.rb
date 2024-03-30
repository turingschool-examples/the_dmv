# require 'spec_helper'

class VehicleFactory
    attr_reader

    def initialize
        
    end

    def create_vehicles(registrations)
        registrations.map do |info|
        info[:name]
        end
    end
end
# wa_ev_registrations = DmvDataService.new.wa_ev_registrations

# if [key] == name || key == make || key == model


# will have to use map instead of doing it on index 0
vehicle_info = wa_ev_registrations[0].select {|key, value| 
    key == :make || key == :model || key == :model_year || key == :vin_1_10}