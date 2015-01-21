require('spec_helper')

describe(Stations) do
  describe(".all") do
    it("returns an array of all values in Stations") do
      expect(Stations.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("returns an array of all values in Stations") do
      test_station = Stations.new({:station_name => "A", :id => 1})
      test_station.save()
      expect(Stations.all()).to(eq([test_station]))
    end
  end

  describe("#station_name") do
    it("returns the name of a given station") do
      test_station1 = Stations.new({:station_name => "A", :id => 1})
      test_station2 = Stations.new({:station_name => "L", :id => 2})
      test_station1.save()
      test_station2.save()
      expect(test_station2.station_name()).to(eq("L"))
    end
  end


end
