# typed: ignore

require "faraday"
require "json"

# Documentation for DmvDataService
class DmvDataService
  def load_data(source)
    response = Faraday.get(source)
    JSON.parse(response.body, symbolize_names: true)
  end

  def wa_ev_registrations
    @wa_ev_registrations ||= load_data("https://data.wa.gov/resource/rpr4-cgyd.json")
  end

  def co_dmv_office_locations
    @co_dmv_office_locations ||= load_data("https://data.colorado.gov/resource/dsw3-mrn4.json")
  end

  def ny_dmv_office_locations
    @ny_dmv_office_locations ||= load_data("https://data.ny.gov/resource/9upz-c7xg.json")
  end

  def mo_dmv_office_locations
    @mo_dmv_office_locations ||= load_data("https://data.mo.gov/resource/835g-7keg.json")
  end

  def ny_vehicle_registrations # rubocop:disable Metrics/MethodLength
    @ny_registrations ||= load_data("https://data.ny.gov/resource/w4pv-hbkt.json")
    ny_vehicle_registrations = []
    @ny_registrations.each do |registration|
      next unless registration[:record_type] == "VEH"

      vehicle = {
        vin_1_10: registration[:vin], # rubocop:disable Naming/VariableNumber
        model_year: registration[:model_year],
        make: registration[:make],
        model: "not specified",
        engine: registration[:fuel_type],
        transaction_date: registration[:reg_valid_date],
        plate_type: nil,
        county: registration[:county]
      }
      vehicle[:engine] = if vehicle[:engine] == "ELECTRIC"
                           :ev
                         else
                           :regular
                         end
      ny_vehicle_registrations.push(vehicle)
    end
    ny_vehicle_registrations
  end
end
