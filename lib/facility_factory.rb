class FacilityFactory
attr_reader :facilities
  def initialize()
    @facilities = []
  end

  def create_facilities(source)
    @facilities << source
    @facilities.flatten!
  end
end