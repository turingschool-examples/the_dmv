require 'spec_helper'

class VehicleFactory
  attr_reader :created_vehicles, :create_vehicles, :most_by_county, :registered_vehicles_by_year, :most_popular_model
  def initialize
    @created_vehicles = []
  end

  def create_vehicles(registrations)
    create_vehicle_based_on_state(registrations)
  end
  
  def most_popular_make(registrations)
    grouped_by_make = registrations.group_by {|car| car[:make] }
    sorted = grouped_by_make.sort_by{|k,v| -v.count}
    top_make = sorted[0][0]
  end

  def most_popular_model(registrations)
    grouped_by_make = registrations.select {|car| car[:make] == most_popular_make(registrations)}
    grouped_by_model = grouped_by_make.group_by {|car| car[:model]}
    sorted_by_model = grouped_by_model.sort_by{|k,v| -v.count}
    top_model = sorted_by_model[0][0]
  end
  
  def most_popular_make_model(registrations)
    "#{most_popular_make(registrations)}, #{most_popular_model(registrations)}"
  end
  
  def registered_vehicles_by_year(registrations, year)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    selected_cars = wa_ev_registrations.find_all {|car| car[:model_year] == year}
    selected_cars.count
  end

  def most_by_county(registrations)
    grouped = registrations.group_by {|car| car[:county]}
    sorted = grouped.sort_by{|k,v| -v.count}
    top_county = sorted[0][0]
  end

  # Helper methods

  def create_vehicle_based_on_state(registrations)
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    ny_state_registrations = DmvDataService.new.ny_state_registrations
    if registrations == wa_ev_registrations
      wa_ev_registrations.each do |car|
        vehicle_details = {
          vin: car[:vin_1_10],
          year: car[:model_year],
          make: car[:make],
          model: car[:model],
          county: car[:county],
          engine: "ev" 
        }
        @created_vehicles << vehicle = Vehicle.new(vehicle_details)
      end
      @created_vehicles
    elsif registrations == ny_state_registrations
      cars = ny_state_registrations.find_all {|vehicle_type| vehicle_type[:record_type] == "VEH"}
      cars.each do |car|
        vehicle_details = {
          vin: car[:vin],
          year: car[:model_year],
          make: car[:make],
          model: car[:model],
          engine: "ev"
        }
        @created_vehicles << vehicle = Vehicle.new(vehicle_details)
      end
      @created_vehicles
    end
  end
end