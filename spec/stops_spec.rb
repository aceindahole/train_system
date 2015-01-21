require('spec_helper')

describe(Stops) do
  describe(".all") do
    it("returns an array of all stops in our database") do
      expect(Stops.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("Saves a stop into our Stops table.") do
      test_train = Trains.new({:train_name => "Blue", :id => nil})
      test_train.save()
      test_station = Stations.new({:station_name => "A", :id => nil})
      test_station.save()
      test_stop = Stops.new({:train_id => test_train.id(), :station_id => test_station.id(), :id => nil})
      test_stop.save()
      expect(Stops.all()).to(eq([test_stop]))
    end
  end

  # describe("#add_stop") do
  #   it("adds a station and train combination to the Stops table")

end
