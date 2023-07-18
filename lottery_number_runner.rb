require './lib/lottery_tracker'
require './lib/lottery_data_service'

tracker = LotteryTracker.new(LotteryDataService.new.ny_lottery_data)
numbers_by_column = tracker.most_likely_with_percent

p "Using the last 1,000 draws from the New York Powerball:"
p "Column 1's most frequent number: #{numbers_by_column[0][0]}, drawn #{numbers_by_column[0][1]} of the time."
p "Column 2's most frequent number: #{numbers_by_column[1][0]}, drawn #{numbers_by_column[1][1]} of the time."
p "Column 3's most frequent number: #{numbers_by_column[2][0]}, drawn #{numbers_by_column[2][1]} of the time."
p "Column 4's most frequent number: #{numbers_by_column[3][0]}, drawn #{numbers_by_column[3][1]} of the time."
p "Column 5's most frequent number: #{numbers_by_column[4][0]}, drawn #{numbers_by_column[4][1]} of the time."
p "Column 6's most frequent number: #{numbers_by_column[5][0]}, drawn #{numbers_by_column[5][1]} of the time."

p "Overall most 'likely' number: #{tracker.most_likely_number}"