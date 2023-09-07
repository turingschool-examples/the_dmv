holiday_arr = ["Thanksgiving",
 "Christmas Day Observed",
 "New Year's Day Observed",
 "Martin Luther King Day",
 "President’s Day",
 "Memorial Day",
 "Juneteenth",
 "Independence Day",
 "Labor Day",
 "Veterans Day",
 "Columbus Day",
 "Lincoln’s Birthday",
 "Truman’s Birthday",
 "Christmas Day",
 "Juneteenth Observed",
 "Thanksgiving Day",
 "Lincoln's Birthday",
 "President's Day",
 "Truman's Birthday",
 "Veteran's Day",
 "Truman Day",
 "Juneteenth Day"]

def uniq_holidays(arr)
  uniq_arr = []
  arr.each.with_index do |holiday, idx|
    first_word = holiday.split(" ")[0]
    if !uniq_arr.to_s.include?(first_word[0..first_word.length-3])
      uniq_arr << holiday
    end
  end
  uniq_arr
end


# p holiday_arr.slice(0, 4)
p uniq_holidays(holiday_arr)

# p holidays_uniq

# p arr.to_s.include?("Truman's")