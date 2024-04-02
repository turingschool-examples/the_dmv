require 'spec_helper'
require 'pry'

RSpec.configure do |config|
    config.formatter = :documentation
end

RSpec.describe Facility do

    it 'exists' do
        factory = VehicleFactory.new

        expect(factory).to be_an_instance_of(VehicleFactory)
    end
end
