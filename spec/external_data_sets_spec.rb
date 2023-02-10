require 'spec_helper'

RSpec.describe 'Vehicle Factory' do
  describe 'exists' do
    it '#is an instance of' do
      factory = VehicleFactory.new
      expect(factory).to be_an_instance_of(VehicleFactory)
    end
  end
end