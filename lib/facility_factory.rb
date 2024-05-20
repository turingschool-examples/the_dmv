# class VehicleFactory 

#     def create_vehicles(vehicle_raw_data)
#         vehicle_raw_data.map do |vehicle| 
#             Vehicle.new(
#                 {
#                     vin: vehicle[:vin_1_10], 
#                     year: vehicle[:model_year], 
#                     make: vehicle[:make], 
#                     model: vehicle[:model], 
#                     engine: :ev
#                 }
#             )
#         end           
#     end
# end