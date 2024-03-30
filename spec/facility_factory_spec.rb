require 'spec_helper'

describe FacilityFactory do
    before do
        @facility_factory = FacilityFactory.new
    end

    it 'is an instance of FacilityFactory' do
       expect(@facility_factory).to be_a(FacilityFactory)
    end
end
