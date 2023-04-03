class DMVFacility

  def create_dmvs(database)
    database.map do |data|
      # require 'pry'; binding.pry
      dmv = Facility.new({
        name: data[:title],
        address: data[:location_1][:human_address].delete("\""),
        phone: data[:phone_number]
      })
    end
  end
end


