require 'rspec'
require 'spec_helper'
require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
  end
  it 'exists' do
   expect(@factory).to be_a(VehicleFactory)
  end
end