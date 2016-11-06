defmodule KV.Bucket do
  @dox """
  Starts a new bucket
  """
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  def get(bucket, key) do
    Agent.get(bucket, &Map.get(&1, key))
  end

  def put(bucket, key, value) do
    Agent.update(bucket, fn map -> Map.put(map, key, value) end)
  end

  def delete(bucket, key) do
    Process.sleep 1000
    Agent.get_and_update(bucket, fn dict ->
      Process.sleep(1000)
      Map.pop dict, key
    end)
  end
end
