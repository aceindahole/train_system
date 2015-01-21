class Stops
  attr_reader(:train_id, :station_id, :id)

  define_method(:initialize) do |attributes|
    @train_id = attributes.fetch(:train_id)
    @station_id = attributes.fetch(:station_id)
    @id = attributes.fetch(:id)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stops (train_id, station_id) VALUES ('#{@train_id}', '#{@station_id}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    returned_stops = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|
      train_id = stop.fetch("train_id").to_i()
      station_id = stop.fetch("station_id").to_i()
      id = stop.fetch("id").to_i()
      stops.push(Stops.new({:train_id => train_id, :station_id => station_id, :id => id}))
    end
    stops
  end

  define_singleton_method(:all_stops) do |id|
    returned_stops = DB.exec("SELECT * FROM stops;")
    stops = []
    returned_stops.each() do |stop|

      if stop.train_id() == id
        stops.push(stop)
      end
    end
    stops
  end




  define_method(:==) do |another_stop|
    self.train_id().==(another_stop.train_id()).&(self.station_id().==(another_stop.station_id())).&(self.id().==(another_stop.id()))
  end

  define_method(:add_stop) do
    added_stops = []
    train = DB.exec("SELECT * FROM trains WHERE train_id = #{@train_id}")
    station = DB.exec("SELECT * FROM stations WHERE station_id = #{@station_id}")
  end

end
