class Trains
  attr_reader(:train_name, :id)

  define_method(:initialize) do |attributes|
    @train_name = attributes.fetch(:train_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_trains = DB.exec("SELECT * FROM trains;")
    trains = []
    returned_trains.each() do |train|
      train_name = train.fetch("train_name")
      id = train.fetch("id").to_i()
      trains.push(Trains.new({:train_name => train_name, :id => id}))
    end
    trains
  end

  define_method(:add_stop) do |stop|
    added_stop = Stops.new({:train_id => self.id(), :station_id => stop.id(), :id => nil})
    added_stop.save()
  end

  define_method(:get_all_stops) do
    Stops.all_stops(self.id())
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO trains (train_name) VALUES ('#{@train_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_train|
    self.train_name().==(another_train.train_name()).&(self.id().==(another_train.id()))
  end

end
