require 'spec_helper'

RSpec.describe RemoteOffices do
  describe 'initialize' do
    it 'is an instance of remote office' do 
      offices = RemoteOffices.new

      expect(offices).to be_an_instance_of(RemoteOffices)
    end
  end
end