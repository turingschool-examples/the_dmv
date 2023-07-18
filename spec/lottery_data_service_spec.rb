require './lib/lottery_data_service'

RSpec.describe LotteryDataService do
  describe "#initialize" do
    it "exists" do
      lds = LotteryDataService.new

      expect(lds).to be_a LotteryDataService
    end
  end

  describe "#load_data" do
    it "can load data from a source" do
      lds = LotteryDataService.new
      source = "https://data.ny.gov/resource/d6yy-54nr.json"
      data = lds.load_data(source)

      expect(data).to be_an Array
    end
  end

  describe "#ny_Lottery_data" do
    it "can load ny lottery data" do
      lds = LotteryDataService.new
      require 'pry';binding.pry
      expect(lds.ny_lottery_data).to be_an Array
    end
  end
end