class VehicleFactory

  def create_vehicles(vehicle)
    # require 'pry'; binding.pry
    name = vehicle[0][:model].downcase
    name = Vehicle.new(vehicle[0])
  end

end

# [{:electric_vehicle_type=>"Plug-in Hybrid Electric Vehicle (PHEV)",
#   :vin_1_10=>"1G1RC6S55J",
#   :dol_vehicle_id=>"186181103",
#   :model_year=>"2018",
#   :make=>"CHEVROLET",
#   :model=>"Volt",
#   :vehicle_primary_use=>"Passenger",
#   :electric_range=>"53",
#   :odometer_reading=>"17655",
#   :odometer_code=>"Actual Mileage",
#   :new_or_used_vehicle=>"Used",
#   :sale_price=>"23990",
#   :date_of_vehicle_sale=>"2021-11-18T00:00:00.000",
#   :base_msrp=>"0",
#   :transaction_type=>"Original Title",
#   :transaction_date=>"2021-12-08T00:00:00.000",
#   :transaction_year=>"2021",
#   :county=>"Clark",
#   :city=>"VANCOUVER",
#   :state_of_residence=>"WA",
#   :zip=>"98685",
#   :non_clean_alternative_fuel=>"HB 2778 Eligiblity Requirements not met",
#   :hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility=>"Clean Alternative Fuel Vehicle",
#   :meets_2019_hb_2042_electric_range_requirement=>true,
#   :meets_2019_hb_2042_sale_date_requirement=>true,
# :