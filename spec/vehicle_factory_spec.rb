require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
      @factory.create_vehicles(@wa_ev_registrations)
      expect(@factory.create_vehicles(@wa_ev_registrations)).to be_an Array
      expect(@factory.create_vehicles(@wa_ev_registrations)).to all be_a Vehicle
      expect(@factory.create_vehicles(@wa_ev_registrations).first.engine).to eq(:ev)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.model).to eq("Volt")
      expect(@factory.create_vehicles(@wa_ev_registrations).first.plate_type).to eq(nil)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.registration_date).to eq(nil)
      expect(@factory.create_vehicles(@wa_ev_registrations).first.vin).to eq("1G1RC6S55J")
      expect(@factory.create_vehicles(@wa_ev_registrations).first.year).to eq("2018")
    end
  end
end