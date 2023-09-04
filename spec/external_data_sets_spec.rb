require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @factory = VehicleFactory.new
  end

  it 'can initialize' do
    expect(@factory).to be_an_instance_of(VehicleFactory)
  end

  it 'can find vehicle data using washington dmv api' do
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
    @factory = VehicleFactory.new
    car_wash = @factory.create_vehicles(wa_ev_registrations)
    car_wash.each do |car|
    expect(car).to be_a(Vehicle)
    expect(car.vin).not_to eq(nil)
    end
    #require 'pry';binding.pry
  end

end

