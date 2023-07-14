require 'spec_helper'
require './lib/facility'
require './lib/vehicle'
require './lib/vehicle_factory'

RSpec.describe VehicleFactory do
    before(:each) do
        @factory = VehicleFactory.new
    end
    
    describe '#initialize' do
      it 'can initialize' do
        expect(@factory).to be_an_instance_of(VehicleFactory)
      end
    end

