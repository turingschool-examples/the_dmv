require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'pry'

RSpec.describe VehicleFactory do
  it "can initialize" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it "can generate electric vehicles" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations

    expect(factory.create_vehicles(wa_ev_registrations)).not_to eq(nil)
  end

  it "can store data in vehicle_instances" do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory.create_vehicles(wa_ev_registrations)
    
    expect(factory.vehicle_instances).not_to eq(nil)
    expect(factory.vehicle_instances).not_to eq([])
    expect(factory.vehicle_instances.empty?).not_to eq(true)

    expect(factory.vehicle_instances.first.to_s).to include("#<Vehicle:")

    factory.vehicle_instances.each do |vehicle|
      expect(vehicle).to be_an_instance_of(Vehicle)
    end
  end

  it "can generate vehicles from New York" do
    factory_ny = VehicleFactory.new
    ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
    factory_ny.create_vehicles(ny_vehicle_registrations)


    expect(factory_ny.vehicle_instances).not_to eq(nil)
    expect(factory_ny.vehicle_instances).not_to eq([])
    expect(factory_ny.vehicle_instances.empty?).not_to eq(true)
  end

  it "can generate vehicles from NY and WA simultaneously" do
    factory_ny = VehicleFactory.new
    ny_vehicle_registrations = DmvDataService.new.ny_vehicle_registrations
    factory_ny.create_vehicles(ny_vehicle_registrations)

    factory_wa = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    factory_wa.create_vehicles(wa_ev_registrations)

    expect(factory_ny.vehicle_instances).not_to eq(nil)
    expect(factory_ny.vehicle_instances).not_to eq([])
    expect(factory_ny.vehicle_instances.empty?).not_to eq(true)
    
    expect(factory_wa.vehicle_instances).not_to eq(nil)
    expect(factory_wa.vehicle_instances).not_to eq([])
    expect(factory_wa.vehicle_instances.empty?).not_to eq(true)
  end

end
