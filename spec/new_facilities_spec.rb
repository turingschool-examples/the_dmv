require './lib/new_facilities'  

RSpec.describe FacilityBuilder do
  it 'exists' do
    facility = FacilityBuilder.new

    expect(facility).to be_a(FacilityBuilder)
  end
end