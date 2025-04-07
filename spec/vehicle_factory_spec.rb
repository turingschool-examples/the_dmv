require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  it 'can initialize' do
    expect(@factory).to be_a(VehicleFactory)
  end

  it 'can create new vehicles with wa_ev_registrations' do
    vehicles = @factory.create_vehicles(@wa_ev_registrations)
    expect(vehicles).to be_a(Array)

    expect(vehicles[0]).to be_a(Vehicle)
    expect(vehicles[0].vin).to eq("5YJYGDED6M")
    expect(vehicles[0].year).to eq(2021)
    expect(vehicles[0].make).to eq("TESLA")
    expect(vehicles[0].model).to eq("Model Y")
    expect(vehicles[0].engine).to eq(:ev)

    expect(vehicles[1]).to be_a(Vehicle)
    expect(vehicles[1].vin).to eq("WBY8P8C51K")
    expect(vehicles[1].year).to eq(2019)
    expect(vehicles[1].make).to eq("BMW")
    expect(vehicles[1].model).to eq("i3")
    expect(vehicles[1].engine).to eq(:ev)

    expect(vehicles[3]).to be_a(Vehicle)
    expect(vehicles[3].vin).to eq("3FMTK4SE2P")
    expect(vehicles[3].year).to eq(2023)
    expect(vehicles[3].make).to eq("FORD")
    expect(vehicles[3].model).to eq("Mustang Mach-E")
    expect(vehicles[3].engine).to eq(:ev)
  end



  

end 