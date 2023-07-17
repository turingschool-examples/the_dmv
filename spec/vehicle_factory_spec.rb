require 'spec_helper'

RSpec.describe VehicleFactory do
  it "exists" do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)        
  end

  it ".create_vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)
    expect(factory.vehicles).to all be_a Vehicle
    expect(factory.vehicles).to be_an Array

    #dependent upon when api is taken
    expect(factory.vehicles.first.make).to eq("CHEVROLET")
    expect(factory.vehicles.first.model).to eq("Volt")
    expect(factory.vehicles.first.vin).to eq("1G1RC6S55J")
    expect(factory.vehicles.first.year).to eq("2018")
    expect(factory.vehicles.first.engine).to eq(:ev)
    expect(factory.vehicles.first.plate_type).to be nil
    expect(factory.vehicles.first.registration_date).to be nil
  end

  it "NY" do
    factory = VehicleFactory.new
    ny_registrations = DmvDataService.new.ny_registrations
    factory.create_vehicles(ny_registrations)
    expect(factory.vehicles).to all be_a Vehicle
    expect(factory.vehicles).to be_an Array

    #dependent upon when api is taken
    expect(factory.vehicles.first.engine).to eq(:ice)
    expect(factory.vehicles.first.make).to eq("STARC")
    expect(factory.vehicles.first.model).to eq("BOAT")
    expect(factory.vehicles.first.vin).to eq("999999999999")
    expect(factory.vehicles.first.year).to eq("1975")
    expect(factory.vehicles.first.plate_type).to be nil
    expect(factory.vehicles.first.registration_date).to be nil
  end

end