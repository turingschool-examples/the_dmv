RSpec.describe VehicleFactory do
  before(:each) do
    @factory = VehicleFactory.new
    @wa_ev_registrations = DmvDataService.new.wa_ev_registrations
  end

  describe "Iteration 2" do
    it 'exists' do
      expect(@factory).to be_an_instance_of(VehicleFactory)
    end
  end
end