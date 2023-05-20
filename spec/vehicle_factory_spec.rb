require 'spec_helper'

RSpec.describe VehicleFactory do
    before(:each) do
        #
    end

    describe '#initialize' do
        it 'should create a new vehicle factory' do
            expect(factory = VehicleFactory.new).to be_an_instance_of(VehicleFactory)
        end
    end
end