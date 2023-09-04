require 'spec_helper'

RSpec.describe Facility do
  before(:each) do
    co_dmv = DmvDataService.new.co_dmv_office_locations
    @facility = FacilityObjects.new
  end

  it 'can initialize' do
    expect(@facility).to be_an_instance_of(FacilityObjects)
  end
  #require 'pry';binding.pry
   it 'can find dmv data using co dmv api' do
    co_dmv = DmvDataService.new.co_dmv_office_locations
    @facility = FacilityObjects.new
    fac_co = @facility.create_facilities(co_dmv)
    fac_co.each do |fac|
     expect(fac).to be_a(Facility)
     #expect(fac.phone).to be_a(?)
    end
     #require 'pry';binding.pry
   end

end