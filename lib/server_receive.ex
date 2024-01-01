defmodule ServerReceive do
  def start_link(data) when is_list(data) do
    # spawn(fn -> data end)
    # pid = spawn_link(fn -> data end)
    spawn_link(ServerReceive, :loop, data)
  end

  def send_message(pid, {:test, message}) do
    send(pid, message)
  end

  def loop(data) do
    receive do
      {:ok, data} -> IO.inspect(data)
      {:test, message} -> IO.inspect(message)
    end
    loop(data)
  end
end
