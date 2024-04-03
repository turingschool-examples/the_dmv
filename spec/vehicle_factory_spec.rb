require 'spec_helper'

RSpec.describe VehicleFactory do
  before(:each) do
    factory = VehicleFactory.new
    wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end





end