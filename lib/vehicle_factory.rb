require './lib/vehicle'
require './lib/vehicle_factory'
require './lib/dmv_data_service'
require 'faraday'
require 'json'
require 'pry'

class VehicleFactory
  attr_accessor
    def initialize
  end

  def create_vehicles(source)
    nc_arr = []
    source.each do |car|
      new_car = {
        vin: car[:vin_1_10],
        year: car[:model_year],
        make: car[:make],
        model: car[:model],
        engine: :ev}
      nc_arr << Vehicle.new(new_car)
    end
    nc_arr
  end

  def find_most_common(source) # I plan to refactor and correct this!
    by_make = []
    by_model = []
    by_make_and_model = []
    source.each do |car|
      car_data = {
        make: car[:make],
        model: car[:model],
        make_and_model: car[:make] + ', ' + car[:model],
      }
      by_make << car_data[:make]
      by_model << car_data[:model]
      by_make_and_model << car_data[:make_and_model]
    end

    tesla_model_s = []
    nissan_leaf = []
    toyota_prius_plug = []
    volvo_xc90 = []
    tesla_x = []
    chevy_volt = []
    fiat_500 = []
    tesla_3 = []
    ford_mustang_mach_e = []
    tesla_model_y = []
    bmw_i3 = []
    audi_e_tron = []
    smart_fortwo_electric = []
    audi_q5_e = []
    bmw_330e = []
    kia_soul = []
    bmw_i8 = []
    ford_escape = []
    mercedes_benz_glc_class = []
    mercedes_benz_eqb_class = []
    chevy_bolt_ev = []
    honda_clarity = []
    volkswagen_id4 = []
    kia_niro = []
    porsche_taycan = []
    volkswagen_egolf = []
    toyota_prius_prime = []
    jeep_wrangler = []
    chevy_bolt_euv = []
    ford_fusion = []
    volvo_xc60 = []
    volvo_xc40 = []
    hyundai_ioniq5 = []
    ford_transit = []
    audi_a3 = []
    hyundai_ioniq = []
    bmw_x5 = []
    porsche_cayenne = []
    ford_focus = []
    toyota_rav4_prime = []
    chrysler_pacifica = []
    porsche_panamera = []
    hyundai_ioniq6 = []
    ford_c_max = []
    bmw_x3 = []
    tesla_roadster = []
    polestar_ps2 = []
    mitsubishi_outlander = []

    by_make_and_model.map do |car|
      if car.include?("TESLA, Model S")
        tesla_model_s << car
      elsif car.include?("NISSAN, Leaf")
        nissan_leaf << car
      elsif car.include?("TOYOTA, Prius Plug-in")
        toyota_prius_plug << car
      elsif car.include?("VOLVO, XC90")
        volvo_xc90 << car
      elsif car.include?("TESLA, Model X")
        tesla_x << car
      elsif car.include?("CHEVROLET, Volt")
        chevy_volt << car
      elsif car.include?("FIAT, 500")
        fiat_500 << car
      elsif car.include?("TESLA, Model 3")
        tesla_3 << car
      elsif car.include?("FORD, Mustang Mach-E")
        ford_mustang_mach_e << car
      elsif car.include?("TESLA, Model Y")
        tesla_model_y << car
      elsif car.include?("BMW, i3")
        bmw_i3 << car
      elsif car.include?("AUDI, e-tron")
        audi_e_tron << car
      elsif car.include?("SMART, Fortwo Electric Drive")
        smart_fortwo_electric << car
      elsif car.include?("AUDI, Q5 e")
        audi_q5_e << car
      elsif car.include?("BMW, 330e")
        bmw_330e << car
      elsif car.include?("KIA, Soul")
        kia_soul << car
      elsif car.include?("BMW, i8")
        bmw_i8 << car
      elsif car.include?("FORD, Escape")
        ford_escape << car
      elsif car.include?("MERCEDES-BENZ, GLC-Class")
        mercedes_benz_glc_class << car
      elsif car.include?("MERCEDES-BENZ, EQB-Class")
        mercedes_benz_eqb_class << car
      elsif car.include?("CHEVROLET, Bolt EV")
        chevy_bolt_ev << car
      elsif car.include?("HONDA, Clarity")
        honda_clarity << car
      elsif car.include?("VOLKSWAGEN, ID.4")
        volkswagen_id4 << car
      elsif car.include?("KIA, Niro")
        kia_niro << car
      elsif car.include?("PORSCHE, Taycan")
        porsche_taycan << car
      elsif car.include?("VOLKSWAGEN, e-Golf")
        volkswagen_egolf << car
      elsif car.include?("TOYOTA, Prius Prime")
        toyota_prius_prime << car
      elsif car.include?("JEEP, Wrangler")
        jeep_wrangler << car
      elsif car.include?("CHEVROLET, Bolt EUV")
        chevy_bolt_euv << car
      elsif car.include?("FORD, Fusion")
        ford_fusion << car
      elsif car.include?("VOLVO, XC60")
        volvo_xc60 << car
      elsif car.include?("VOLVO, XC40")
        volvo_xc40 << car
      elsif car.include?("HYUNDAI, IONIQ 5")
        hyundai_ioniq5 << car
      elsif car.include?("FORD, Transit")
        ford_transit << car
      elsif car.include?("AUDI, A3")
        audi_a3 << car
      elsif car.include?("HYUNDAI, Ioniq")
        hyundai_ioniq << car
      elsif car.include?("BMW, X5")
        bmw_x5 << car
      elsif car.include?("PORSCHE, Cayenne")
        porsche_cayenne << car
      elsif car.include?("FORD, Focus")
        ford_focus << car
      elsif car.include?("TOYOTA, RAV4 Prime")
        toyota_rav4_prime << car
      elsif car.include?("CHRYSLER, Pacifica")
        chrysler_pacifica << car
      elsif car.include?("PORSCHE, Panamera")
        porsche_panamera << car
      elsif car.include?("HYUNDAI, Ioniq 6")
        hyundai_ioniq6 << car
      elsif car.include?("FORD, C-Max")
        ford_c_max << car
      elsif car.include?("BMW, X3")
        bmw_x3 << car
      elsif car.include?("TESLA, Roadster")
        tesla_roadster << car
      elsif car.include?("POLESTAR, PS2")
        polestar_ps2 << car
      elsif car.include?("MITSUBISHI, Outlander")
        mitsubishi_outlander << car
      end
    end

    car_list_array = ["tesla_model_s = #{tesla_model_s.count}",
    "nissan_leaf = #{nissan_leaf.count}",
    "toyota_prius_plug = #{toyota_prius_plug.count}",
    "volvo_xc90 = #{volvo_xc90.count}",
    "tesla_x = #{tesla_x.count}",
    "chevy_volt = #{chevy_volt.count}",
    "fiat_500 = #{fiat_500.count}",
    "tesla_3 = #{tesla_3.count}",
    "ford_mustang_mach_e = #{ford_mustang_mach_e.count}",
    "tesla_model_y = #{tesla_model_y.count}",
    "bmw_i3 = #{bmw_i3.count}",
    "audi_e_tron = #{audi_e_tron.count}",
    "smart_fortwo_electric = #{smart_fortwo_electric.count}",
    "audi_q5_e = #{audi_q5_e.count}",
    "bmw_330e = #{bmw_330e.count}",
    "kia_soul = #{kia_soul.count}",
    "bmw_i8 = #{bmw_i8.count}",
    "ford_escape = #{ford_escape.count}",
    "mercedes_benz_glc_class = #{mercedes_benz_glc_class.count}",
    "mercedes_benz_eqb_class = #{mercedes_benz_eqb_class.count}",
    "chevy_bolt_ev = #{chevy_bolt_ev.count}",
    "honda_clarity = #{honda_clarity.count}",
    "volkswagen_id4 = #{volkswagen_id4.count}",
    "kia_niro = #{kia_niro.count}",
    "porsche_taycan = #{porsche_taycan.count}",
    "volkswagen_egolf = #{volkswagen_egolf.count}",
    "toyota_prius_prime = #{toyota_prius_prime.count}",
    "jeep_wrangler = #{jeep_wrangler.count}",
    "chevy_bolt_euv = #{chevy_bolt_euv.count}",
    "ford_fusion = #{ford_fusion.count}",
    "volvo_xc60 = #{volvo_xc60.count}",
    "volvo_xc40 = #{volvo_xc40.count}",
    "hyundai_ioniq5 = #{hyundai_ioniq5.count}",
    "ford_transit = #{ford_transit.count}",
    "audi_a3 = #{audi_a3.count}",
    "hyundai_ioniq = #{hyundai_ioniq.count}",
    "bmw_x5 = #{bmw_x5.count}",
    "porsche_cayenne = #{porsche_cayenne.count}",
    "ford_focus = #{ford_focus.count}",
    "toyota_rav4_prime = #{toyota_rav4_prime.count}",
    "chrysler_pacifica = #{chrysler_pacifica.count}",
    "porsche_panamera = #{porsche_panamera.count}",
    "hyundai_ioniq6 = #{hyundai_ioniq6.count}",
    "ford_c_max = #{ford_c_max.count}",
    "bmw_x3 = #{bmw_x3.count}",
    "tesla_roadster = #{tesla_roadster.count}",
    "polestar_ps2 = #{polestar_ps2.count}",
    "mitsubishi_outlander = #{mitsubishi_outlander.count}"]

    car_list_array.sort
  end

  def count_by_year(source) # This as well.
    arr_of_count = []
      year2008 = 0
      year2009 = 0
      year2010 = 0
      year2011 = 0
      year2012 = 0
      year2013 = 0
      year2014 = 0
      year2015 = 0
      year2016 = 0
      year2017 = 0
      year2018 = 0
      year2019 = 0
      year2020 = 0
      year2021 = 0
      year2022 = 0
      year2023 = 0

    source.each do |car|
      arr_of_count << car[:model_year]
    end
      arr_of_count.each do |year|
          if year.include?("2008")
            year2008 += 1
          elsif year.include?("2009")
            year2009 += 1
          elsif year.include?("2010")
            year2010 += 1
          elsif year.include?("2011")
            year2011 += 1
          elsif year.include?("2012")
            year2012 += 1
          elsif year.include?("2013")
            year2013 += 1
          elsif year.include?("2014")
            year2014 += 1
          elsif year.include?("2015")
            year2015 += 1
          elsif year.include?("2016")
            year2016 += 1
          elsif year.include?("2017")
            year2017 += 1
          elsif year.include?("2018")
            year2018 += 1
          elsif year.include?("2019")
            year2019 += 1
          elsif year.include?("2020")
            year2020 += 1
          elsif year.include?("2021")
            year2021 += 1
          elsif year.include?("2022")
            year2022 += 1
          elsif year.include?("2023")
            year2023 += 1
      end
    end
      p "List of number of cars by year."
      p "year2008 = #{year2008}"
      p "year2009 = #{year2009}"
      p "year2010 = #{year2010}"
      p "year2011 = #{year2011}"
      p "year2012 = #{year2012}"
      p "year2013 = #{year2013}"
      p "year2014 = #{year2014}"
      p "year2015 = #{year2015}"
      p "year2016 = #{year2016}"
      p "year2017 = #{year2017}"
      p "year2018 = #{year2018}"
      p "year2019 = #{year2019}"
      p "year2020 = #{year2020}"
      p "year2021 = #{year2021}"
      p "year2022 = #{year2022}"
      p "year2023 = #{year2023}"
  end

  def most_in_county(source)
    county_list = []
    source.each do |car|
      county_list << car[:county]
    end
#I found help on stack overflow to do build this, which makes a new Hash with the county name as key,
    count_hash = county_list.inject(Hash.new(0)) { |county, count| county[count] += 1; county }# and count as the value.
    p county_list.max_by { |quantity| count_hash[quantity] }# Finds max count of county, iterating thru Hash values.
  end
end
