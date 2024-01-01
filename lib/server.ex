defmodule Server do
  use GenServer
  use Using, [:name] #exemple __using__ macro and call parameters

  def start_link(n, data) do
    name = via_tuple(n)
    GenServer.start_link(__MODULE__, data, name: name)
  end

  def init(data) do
    data = Server.using_struct(data)
    {:ok, data}
  end

  def cast_data(pid) do
    GenServer.cast(via_tuple(pid), :cast)
  end

  def call_data(pid) do
    GenServer.call(via_tuple(pid), :call)
  end

  def stop_me(pid) do
    GenServer.cast(via_tuple(pid), :stop_me)
  end

  def handle_cast(:stop_me, state) do
    {:stop, :shutdown, state}
  end

  def handle_cast(:cast, state) do
    {:noreply, state}
  end

  def terminate(comm, state) do
    IO.inspect(comm)
    IO.inspect(state)
    {:shutdown, state}
  end

  def handle_call(:call, from, state) do
    {:reply, from, state}
  end

  def callback_get(4) do
    :callback
  end

  defp via_tuple(name) do
    {:via, Registry, {Meta.Registry, name}}
  end
end
