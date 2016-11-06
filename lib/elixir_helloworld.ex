defmodule KV do
  use Application

  def start(_type, _arg) do
    KV.Supervisor.start_link
  end
end
