require './spec/spec_helper'
require 'pry'
# wa_ev_dds = DmvDataService.new.wa_ev_registrations
vehicles = VehicleFactory.new.create_vehicles(DmvDataService.new.wa_ev_registrations)

makes_sorted = vehicles.reduce({}) do |make_obj, vehicle|
  make_obj.keys.include?(vehicle.make) ? make_obj[vehicle.make] += 1 : make_obj[vehicle.make] = 1
  make_obj
end.sort_by{|k,v| v}.reverse.to_h

# Sorted (descending) output from printing makes_sorted hash variable below. 'Tesla' is by far the most popular electric vehicle in Washington
# with 230 more vehicles than the second most popular make, 'Nissan.'

# Washington EV registrations by vehicle model

# {"TESLA"=>424,
#  "NISSAN"=>194,
#  "CHEVROLET"=>85,
#  "BMW"=>53,
#  "KIA"=>43,
#  "TOYOTA"=>40,
#  "FORD"=>38,
#  "VOLKSWAGEN"=>32,
#  "CHRYSLER"=>15,
#  "VOLVO"=>12,
#  "PORSCHE"=>11,
#  "CADILLAC"=>11,
#  "MERCEDES-BENZ"=>7,
#  "FIAT"=>7,
#  "JEEP"=>5,
#  "RIVIAN"=>5,
#  "HONDA"=>4,
#  "HYUNDAI"=>4,
#  "AUDI"=>3,
#  "JAGUAR"=>3,
#  "POLESTAR"=>2,
#  "LINCOLN"=>2}


year_sorted = vehicles.reduce({}) do |year_obj, vehicle|
  year_obj.keys.include?(vehicle.year) ? year_obj[vehicle.year] += 1 : year_obj[vehicle.year] = 1
  year_obj
end.sort_by{|k,v| v}.reverse.to_h

# Sorted (descending) output from year_sorted hash variable below. One possible trend to continue researching would be whether
# the market for EVs peaked in 2018. From 2008 to 2018, EV registrations steadily increased. Beginning in 2019, however, EV registrations
# have steadily declined. It will be interesting to see if this trend continues and, if so, why?

# Washington EV registrations by vehicle year

  # {"2018"=>128,
  # "2017"=>113,
  # "2019"=>102,
  # "2021"=>99,
  # "2016"=>93,
  # "2022"=>88,
  # "2013"=>72,
  # "2015"=>70,
  # "2023"=>65,
  # "2020"=>63,
  # "2014"=>55,
  # "2012"=>29,
  # "2011"=>11,
  # "2010"=>10,
  # "2008"=>2}
  

wa_dds = DmvDataService.new.wa_ev_registrations

county_sorted = wa_dds.reduce({}) do |county_obj, vehicle|
  county_obj.keys.include?(vehicle[:county]) ? county_obj[vehicle[:county]] += 1 : county_obj[vehicle[:county]] = 1
  county_obj
end.sort_by{|k,v| v}.reverse.to_h

# Output from county_sorted object variable. King County has by far the most EVs registered. King County is the most populated county in the
# state, with about 1.3 million more residents than the next largest county, Pierce (which isn't even represented below). King County includes
# the cities of Seattle and Bellevue.

# Washington EV registrations by county

# {"King"=>822, "Clark"=>103, "Kitsap"=>28, "Thurston"=>17, "Snohomish"=>11, "Yakima"=>9, "Jefferson"=>7, "Island"=>3}


co_dds = DmvDataService.new.co_dmv_office_locations
co_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.co_dmv_office_locations)

mo_dds = DmvDataService.new.mo_dmv_office_locations
mo_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.mo_dmv_office_locations)

ny_dds = DmvDataService.new.ny_dmv_office_locations
ny_facilities = FacilityFactory.new.create_facilities(DmvDataService.new.ny_dmv_office_locations)

def get_holidays_no_dates(dds)
  holiday_arr = []
  dds.map do |facility|
    facility.each do |key, val|
      if key.to_s.include?('holidaysclosed') && !val.include?('Unable to process CDL transactions')
        val.split(",").each do |holiday|
          holiday_fmtd = (holiday.scan(/\D+[^(\d\/\d\/\d)]/mi))[0].strip
          if !holiday_arr.include?(holiday_fmtd)
            holiday_arr << holiday_fmtd
          end
        end
      end
    end
  end
  holiday_arr = holiday_arr.map do |holiday|
    holiday.split(" ").map{ |word| word.capitalize }.join(" ")
  end.uniq
  holiday_arr
end

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

def get_holidays_not_cleaned(dds)
  holiday_arr = []
  dds.map do |facility|
    facility.each do |key, val|
      if key.to_s.include?('holidaysclosed') && !val.include?('Unable to process CDL transactions')
        val.split(",").each do |holiday|
          if !holiday_arr.include?(holiday)
            holiday_arr << holiday
          end
        end
      end
    end
  end
  holiday_arr = holiday_arr.map do |holiday|
    holiday.split(" ").map{ |word| word.capitalize }.join(" ")
  end.uniq
  holiday_arr
end

# missouri_holidays_unique removes duplicate holidays - a result of the same holiday having subtle name difference
missouri_holidays_unique = uniq_holidays(get_holidays_no_dates(mo_dds))

missouri_holidays_not_cleaned = get_holidays_not_cleaned(mo_dds)