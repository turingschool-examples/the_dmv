class FacilityFactory

  def initialize; end

  def create_facility(facilities)
    facilities.map do |facility|
      Facility.new({
                name: "Albany DMV Office",
                address: ,
                phone: "541-967-2014"
      })
    end
  end
end