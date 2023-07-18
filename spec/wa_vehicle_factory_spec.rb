require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end

  describe '#wa_ev_registrations' do
    it 'allows me to see pulled data from wa_ev_registrations' do
      # require 'pry' ; binding.pry
      expect(@wa_ev_registrations).to include()
    end
  end

  describe '#create WA vehicles in hashed structure' do
    it 'creates WA vehicles in hashed structure' do
      # require 'pry' ; binding.pry
      expect(@factory.create_vehicles(@wa_ev_registrations)).to include()
    end
  end

  describe '#create WA vehicles' do
    it 'checks against object_1 Volt pulled from hashed structure' do
      # require 'pry' ; binding.pry
      expect(@factory.create_vehicles(@wa_ev_registrations)).to include(having_attributes(
      electric_vehicle_type: "Plug-in Hybrid Electric Vehicle (PHEV)",
      vin_1_10: "1G1RC6S55J",
      dol_vehicle_id: "186181103",
      model_year: "2018",
      make: "CHEVROLET",
      model: "Volt"))
    end
  end

  describe '#create WA vehicles' do
    it 'checks against object_2 Tesla pulled from hashed structure' do
      # require 'pry' ; binding.pry
      expect(@factory.create_vehicles(@wa_ev_registrations)).to include(having_attributes(
        electric_vehicle_type: "Battery Electric Vehicle (BEV)",
        vin_1_10: "7SAYGDEEXP",
        dol_vehicle_id: "240823950",
        model_year:"2023",
        make:"TESLA",
        model:"Model Y"))
    end
  end
end