require 'spec_helper'

RSpec.describe FacilityBuilder do
  before(:each) do
    @builder = FacilityBuilder.new
  end

  describe '#initialize' do
    it 'can initialize a facility builder' do
      expect(@builder).to be_a(FacilityBuilder)
      expect(@builder.facilities).to eq([])
    end
  end
end