require './lib/facility_factory'
require './lib/facility'
require './lib/dmv_data_service'

RSpec.describe FacilityFactory do
  before(:each) do
    @factory = FacilityFactory.new
  end

  it 'exists' do
    expect(@factory).to be_a(FacilityFactory)
  end

  it 'can create facilities from CO data' do
    co_data = DmvDataService.new.co_dmv_office_locations
    co_facilities = @factory.create_facilities(co_data)

    expect(co_facilities).to be_an(Array)
    expect(co_facilities.first).to be_a(Facility)
  end

  it 'can create facilities from NY data' do
    ny_data = DmvDataService.new.ny_dmv_office_locations
    ny_facilities = @factory.create_facilities(ny_data)

    expect(ny_facilities).to be_an(Array)
    expect(ny_facilities.first).to be_a(Facility)
  end

  it 'can create facilities from MO data' do
    mo_data = DmvDataService.new.mo_dmv_office_locations
    mo_facilities = @factory.create_facilities(mo_data)

    expect(mo_facilities).to be_an(Array)
    expect(mo_facilities.first).to be_a(Facility)
  end
end
