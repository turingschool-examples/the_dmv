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

  # describe '#most_popular_make_model' do
  #   it 'returns most popular make and model' do
  #     expect(@analytics.most_popular_make_model).to be_an_instance_of(String)
  #   end
  # end

  describe '#most_popular_make' do
    it 'returns most popular make' do
      expect(@analytics.most_popular_make).to be_an_instance_of(String)
      expect(@analytics.source.map{|car| car[:make]}).to include(@analytics.most_popular_make)
    end
  end

  describe '#most_popular_model' do
    it 'returns most popular model' do
      expect(@analytics.most_popular_model).to be_an_instance_of(String)
      expect(@analytics.source.map{|car| car[:model]}).to include(@analytics.most_popular_model)
    end
end

end