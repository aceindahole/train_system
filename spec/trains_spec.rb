require('spec_helper')

describe(Trains) do
  describe(".all") do
    it("returns an array of all values in Trains") do
      expect(Trains.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("returns an array of all values in Trains") do
      test_train = Trains.new({:train_name => "Max 14", :id => 1})
      test_train.save()
      expect(Trains.all()).to(eq([test_train]))
    end
  end

  describe("#train_name") do
    it("returns the name of a given train") do
      test_train1 = Trains.new({:train_name => "Max 14", :id => 1})
      test_train2 = Trains.new({:train_name => "Max 36", :id => 2})
      test_train1.save()
      test_train2.save()
      expect(test_train2.train_name()).to(eq("Max 36"))
    end
  end

  describe("#add_stop") do
    it("Adds a stop for a given train") do
      test_train = Trains.new({:train_name => "Blue", :id => nil})
      test_station = Stations.new({:station_name => "O", :id => nil})
      test_train.save()
      test_station.save()
      test_train.add_stop(test_station)
      expect(Stops.all().count()).to(eq(1))
    end
  end

  describe("#get_all_stops") do
    it("returns all stops for a given train line") do
      test_train = Trains.new({:train_name => "Blue", :id => nil})
      test_train.save()
      stop_range = ("A".."Z").to_a()

      stop_range.each() do |stop|
        test_station = Stations.new({:station_name => stop, :id => nil})
        test_station.save()
        test_train.add_stop(test_station)
      end

      expect(test_train.get_all_stops()).to(eq(26))
    end
  end


end
