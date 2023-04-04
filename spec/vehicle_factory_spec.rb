require "spec_helper"

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @three_mock_wa_ev_regs = [
      {
        electric_vehicle_type: "Battery Electric Vehicle (BEV)",
        vin_1_10: "WMEEJ9AA7E",
        dol_vehicle_id: "349158127",
        model_year: "2014",
        make: "SMART",
        model: "Fortwo Electric Drive",
        vehicle_primary_use: "Passenger",
        electric_range: "58",
        odometer_reading: "0",
        odometer_code: "Odometer reading is not collected at time of renewal",
        new_or_used_vehicle: "Used",
        sale_price: "0",
        base_msrp: "0",
        transaction_type: "Registration Renewal",
        transaction_date: "2022-06-06T00:00:00.000",
        transaction_year: "2022",
        county: "King",
        city: "SEATTLE",
        state_of_residence: "WA",
        zip: "98102",
        non_clean_alternative_fuel: "HB 2778 Eligiblity Requirements not met",
        hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility: "HB 2042 Eligibility Requirements not met",
        meets_2019_hb_2042_electric_range_requirement: true,
        meets_2019_hb_2042_sale_date_requirement: false,
        meets_2019_hb_2042_sale_price_value_requirement: false,
        _2019_hb_2042_battery_range_requirement: "Meets battery range requirement",
        _2019_hb_2042_purchase_date_requirement: "Non-sale, registration transaction",
        _2019_hb_2042_sale_price_value_requirement: "Non-sale, registration transaction",
        electric_vehicle_fee_paid: "Yes",
        transportation_electrification_fee_paid: "Yes",
        hybrid_vehicle_electrification_fee_paid: "No",
        census_tract_2020: "53033007501",
        legislative_district: "43",
        electric_utility: "CITY OF SEATTLE - (WA)|CITY OF TACOMA - (WA)"
      },
      {
        electric_vehicle_type: "Battery Electric Vehicle (BEV)",
        vin_1_10: "WVWKR7AU7K",
        dol_vehicle_id: "296928922",
        model_year: "2019",
        make: "VOLKSWAGEN",
        model: "e-Golf",
        vehicle_primary_use: "Passenger",
        electric_range: "125",
        odometer_reading: "5",
        odometer_code: "Actual Mileage",
        new_or_used_vehicle: "New",
        sale_price: "23988",
        date_of_vehicle_sale: "2019-10-12T00:00:00.000",
        base_msrp: "0",
        transaction_type: "Original Title",
        transaction_date: "2019-11-06T00:00:00.000",
        transaction_year: "2019",
        county: "King",
        city: "REDMOND",
        state_of_residence: "WA",
        zip: "98052",
        non_clean_alternative_fuel: "HB 2778 Eligiblity Requirements not met",
        hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility: "Clean Alternative Fuel Vehicle",
        meets_2019_hb_2042_electric_range_requirement: true,
        meets_2019_hb_2042_sale_date_requirement: true,
        meets_2019_hb_2042_sale_price_value_requirement: true,
        _2019_hb_2042_battery_range_requirement: "Meets battery range requirement",
        _2019_hb_2042_purchase_date_requirement: "Meets purchase date requirement",
        _2019_hb_2042_sale_price_value_requirement: "Meets title transaction requirement",
        electric_vehicle_fee_paid: "Not Applicable",
        transportation_electrification_fee_paid: "Not Applicable",
        hybrid_vehicle_electrification_fee_paid: "Not Applicable",
        census_tract_2020: "53033032330",
        legislative_district: "45",
        electric_utility: "PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"
      },
      {
        electric_vehicle_type: "Plug-in Hybrid Electric Vehicle (PHEV)",
        vin_1_10: "WP0AE2A77K",
        dol_vehicle_id: "154396301",
        model_year: "2019",
        make: "PORSCHE",
        model: "Panamera",
        vehicle_primary_use: "Passenger",
        electric_range: "14",
        odometer_reading: "2729",
        odometer_code: "Actual Mileage",
        new_or_used_vehicle: "Used",
        sale_price: "79650",
        date_of_vehicle_sale: "2021-03-24T00:00:00.000",
        base_msrp: "0",
        transaction_type: "Original Title",
        transaction_date: "2021-04-27T00:00:00.000",
        transaction_year: "2021",
        county: "King",
        city: "REDMOND",
        state_of_residence: "WA",
        zip: "98052",
        non_clean_alternative_fuel: "HB 2778 Eligiblity Requirements not met",
        hb_2042_clean_alternative_fuel_vehicle_cafv_eligibility: "HB 2042 Eligibility Requirements not met",
        meets_2019_hb_2042_electric_range_requirement: false,
        meets_2019_hb_2042_sale_date_requirement: true,
        meets_2019_hb_2042_sale_price_value_requirement: false,
        _2019_hb_2042_battery_range_requirement: "Low battery range",
        _2019_hb_2042_purchase_date_requirement: "Meets purchase date requirement",
        _2019_hb_2042_sale_price_value_requirement: "Sale price too high",
        electric_vehicle_fee_paid: "Not Applicable",
        transportation_electrification_fee_paid: "Not Applicable",
        hybrid_vehicle_electrification_fee_paid: "Not Applicable",
        census_tract_2020: "53033032330",
        legislative_district: "45",
        electric_utility: "PUGET SOUND ENERGY INC||CITY OF TACOMA - (WA)"
      }
    ]
  end

  describe "#initialize" do
    it "can initialize" do
      expect(@factory).to be_an_instance_of(VehicleFactory)
      expect(@factory.vehicles).to eq([])
    end
  end

  describe "#create_vehicles" do
    it "can create a vehicle from a mock database" do
      expect(@factory.vehicles).to eq([])
      @factory.create_vehicles(@three_mock_wa_ev_regs)
      expect(@factory.vehicles.first).to be_an_instance_of(Vehicle)
      expect(@factory.vehicles.first.vin).to eq("WMEEJ9AA7E")
      expect(@factory.vehicles.first.year).to eq("2014")
      expect(@factory.vehicles.first.make).to eq("SMART")
      expect(@factory.vehicles.first.model).to eq("Fortwo Electric Drive")
    end

    it "can create many vehicles from a mock database" do
      expect(@factory.vehicles).to eq([])
      @factory.create_vehicles(@three_mock_wa_ev_regs)
      expect(@factory.vehicles.count).to be == 3
      expect(@factory.vehicles.last).to be_an_instance_of(Vehicle)
      expect(@factory.vehicles.last.vin).to eq("WP0AE2A77K")
      expect(@factory.vehicles.last.year).to eq("2019")
      expect(@factory.vehicles.last.make).to eq("PORSCHE")
      expect(@factory.vehicles.last.model).to eq("Panamera")
    end

    it "can create a vehicle from a real database" do
      expect(@factory.vehicles).to eq([])
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.vehicles.first).to be_an_instance_of(Vehicle)
      expect(@factory.vehicles.first.vin).to be_truthy
      expect(@factory.vehicles.first.year).to be_truthy
      expect(@factory.vehicles.first.make).to be_truthy
      expect(@factory.vehicles.first.model).to be_truthy
    end

    it "can create many vehicles from a real database" do
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.vehicles.count).to be > 100
      expect(@factory.vehicles.last).to be_an_instance_of(Vehicle)
      expect(@factory.vehicles.last.vin).to be_truthy
      expect(@factory.vehicles.last.year).to be_truthy
      expect(@factory.vehicles.last.make).to be_truthy
      expect(@factory.vehicles.last.model).to be_truthy
    end
  end
end
