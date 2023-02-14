require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'

RSpec.describe VehicleFactory do
  describe '#initialize' do 
    it 'exists' do
      factory = VehicleFactory.new
      expect(factory).to be_a(Factory)
    end
    
  end
end