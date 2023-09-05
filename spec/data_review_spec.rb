require 'spec_helper'

RSpec.describe DataReview do
  before(:each) do
    @creator = FacilityCreator.new
    @factory = VehicleFactory.new
    @co_dmv_registrations = [] 
    @co_dmv_registrations << DmvDataService.new.co_dmv_office_locations[0]
    @facility_1 = @creator.create_facility(@co_dmv_registrations)
    @wa_ev_registrations = [] 
    @wa_ev_registrations << DmvDataService.new.wa_ev_registrations[0]
    @wa_ev_registrations << DmvDataService.new.wa_ev_registrations[1]
    @wa_ev_registrations << DmvDataService.new.wa_ev_registrations[2]
    @vehicles = @factory.create_vehicles(@wa_ev_registrations)
    @facility_1.first.add_service("Vehicle Registration")
    @facility_1.first.register_vehicle(@vehicles[0])
    @facility_1.first.register_vehicle(@vehicles[1])
    @facility_1.first.register_vehicle(@vehicles[2])
    @research = DataReview.new(@facility_1[0])
  end 

  it 'can create a new research variable that is analyzing one facility' do
    expect(@research.class).to be_a (DataReview)
  end

  it 'can find the popular make by facility'
    expect(@research.find_popular_by_make).to be ("Tesla is the most popular make at the DMV Tremont Branch)
  end

  it 'can find the popular model by facility'
  expect(@research.find_popular_by_make).to be (""Leaf is the most popular make at the DMV Tremont Branch")
  end

  it 'can return the registered vehicle count by given model year'
  expect(@research.registered_vehicle_count_by_model_year(2015)).to eq("1 registered vehicle per the model year of 2015 at the DMV Tremont Branch")

end