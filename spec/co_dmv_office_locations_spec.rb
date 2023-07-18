require 'spec_helper'

RSpec.describe Dmv_Office do
  before(:each) do
    @office = Dmv_Office.new
    @co_dmv_office_locations = DmvDataService.new.co_dmv_office_locations
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@office).to be_an_instance_of(Dmv_Office)
    end
  end

  describe '#co_dmv_locations' do
    it 'shows pulled data from co_dmv_locations' do
      # require 'pry' ; binding.pry
      expect(@co_dmv_office_locations).to include()
    end
  end

  describe '#co_dmv_office_locations' do
    it 'creates hashes for offices' do
      # require 'pry' ; binding.pry
      expect(@office.create_offices(@co_dmv_office_locations)).to include()
    end
  end
end