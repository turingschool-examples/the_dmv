require './lib/lottery_data_service'
require './lib/lottery_tracker'

RSpec.describe LotteryTracker do
  describe "#initialize" do
    it "exists" do
      tracker = LotteryTracker.new("placeholder")

      expect(tracker).to be_a LotteryTracker
    end

    it "has a dataset on initialize" do
      tracker = LotteryTracker.new(LotteryDataService.new.ny_lottery_data)

      expect(tracker.dataset).to be_an Array
      expect(tracker.dataset).to_not be_empty
    end
  end
end