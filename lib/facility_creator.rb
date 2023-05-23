require 'json'

class FacilityCreator
  def create_facility_from_oregon(dmv_details)
    vehicle_details.map do |vehicle|
      vehicle_hash = {
      :vin => vehicle[:vin_1_10],
      :year => vehicle[:model_year],
      :make => vehicle[:make],
      :model => vehicle[:model],
      :engine => :ev
      }
  end
end