class Stations
  attr_reader(:station_name, :id)

  define_method(:initialize) do |attributes|
    @station_name = attributes.fetch(:station_name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_stations = DB.exec("SELECT * FROM stations;")
    stations = []
    returned_stations.each() do |station|
      station_name = station.fetch("station_name")
      id = station.fetch("id").to_i()
      stations.push(Stations.new({:station_name => station_name, :id => id}))
    end
    stations
  end
  #
  #   define_singleton_method(:find) do |id|
  #     found_list = nil
  #     List.all().each() do |list|
  #       if list.id().==(id)
  #         found_list = list
  #       end
  #     end
  #     found_list
  #   end
  #
  define_method(:save) do
    result = DB.exec("INSERT INTO stations (station_name) VALUES ('#{@station_name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end
  #
  define_method(:==) do |another_station|
    self.station_name().==(another_station.station_name()).&(self.id().==(another_station.id()))
  end

  #
  #   define_method(:tasks) do
  #     list_tasks = []
  #     tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id()};")
  #     tasks.each() do |task|
  #       description = task.fetch("description")
  #       list_id = task.fetch("list_id").to_i()
  #       list_tasks.push(Task.new({:description => description, :list_id => list_id}))
  #     end
  #     list_tasks
  #   end
end
