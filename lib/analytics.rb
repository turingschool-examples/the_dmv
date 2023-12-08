class Analytics
  # def find_most_popular_make_model(ev_registration)
  #   make_count = Hash.new(0)
  #   model_count = Hash.new(0)
  #   max_count_make = 0
  #   max_count_model = 0
  #   make_name = nil
  #   model_name = nil
  #   most_popular_model = nil
  #   most_popular_make = nil
  #   ev_registration.each do |registration|
  #     make_count[registration[:make]] += 1
  #     # if make_count[registration[:make]] > max_count_make
  #     #   max_count_make = make_count[registration[:make]]
  #     #   make_name = registration[:make]
  #     # end

  #     model_count[registration[:model]] += 1
  #     if model_count[registration[:model]] > max_count_model
  #       max_count_model = model_count[registration[:model]]
  #       model_name = registration[:model]
  #     end
  #   end

  #   result = {:most_popular_make=>make_name, :most_popular_model=>model_name}
  # end
  def find_most_popular_make_and_model(ev_registrations)

    make_count = Hash.new(0)
    model_count = Hash.new(0)

    ev_registrations.each do |registration|
      make_count[registration[:make]] += 1
      model_count[registration[:model]] += 1
    end

    most_popular_make = make_count.max_by {|make,count| count }
    most_popular_model = model_count.max_by {|make,count| count}
    result = {most_popular_make: most_popular_make, most_popular_model: most_popular_model}
  end

  def count_registered_vehicles_by_model_year(ev_registrations)
    model_year_count = Hash.new(0)

    ev_registrations.each do |registration|
      model_year_count[registration[:model_year]] += 1
    end

    model_year_count
  end
end
