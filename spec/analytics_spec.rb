require 'spec_helper'

RSpec.describe do
  before(:each) do
    @dds = DmvDataService.new.wa_ev_registrations
    @analytics = Analytics.new(@dds)
  end

  describe '#initialize' do
    it 'exists' do
      expect(@analytics).to be_an_instance_of(Analytics)
    end

    it 'has a source' do
      expect(@analytics.source).to eq(@dds)
      expect(@analytics.source).to be_an_instance_of(Array)
      expect(@analytics.source[0]).to be_an_instance_of(Hash)
    end
  end

end