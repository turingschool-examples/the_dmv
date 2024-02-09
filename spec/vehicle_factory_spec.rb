require 'spec_helper'

RSpec.describe VehicleFactory do
  let (:factory) { VehicleFactory.new }
  let (:wa_ev_registrations) { DmvDataService.new.wa_ev_registrations }
  it 'exists' do
    expect(factory).to be_an_instance_of(VehicleFactory)
  end

  it 'has no vehicles by default' do
    expect(factory.vehicles).to be_empty
  end
end