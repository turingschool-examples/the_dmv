require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require './lib/facility_creator'

RSpec.describe Facility do
  it 'can create a new class of Vehicle Factory' do
    factory = VehicleFactory.new
    expect(factory).to be_a(VehicleFactory)
  end

  it 'can store wa_ev_registrations into an array of hashes' do
    factory = VehicleFactory.new
    wa_ev_registrations = [] 
    wa_ev_registrations << DmvDataService.new.wa_ev_registrations[0]
    wa_ev_registrations << DmvDataService.new.wa_ev_registrations[1]
    wa_ev_registrations << DmvDataService.new.wa_ev_registrations[2]
    expect(wa_ev_registrations.count).to eq(3)
  end

  it 'can change the registrations into new vehicles' do
    factory = VehicleFactory.new
    wa_ev_registrations = [] 
    wa_ev_registrations << DmvDataService.new.wa_ev_registrations[0]
    wa_ev_registrations << DmvDataService.new.wa_ev_registrations[1]
    wa_ev_registrations << DmvDataService.new.wa_ev_registrations[2]
    check_results = []
    check_results = factory.create_vehicles(wa_ev_registrations)
    expect(check_results.count).to eq(3)
    expect(check_results.class).to eq(Array)
    expect(check_results[0]).to be_a(Vehicle)
  end


end