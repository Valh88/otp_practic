defmodule ServerAgent do
  use Agent


  def start_link(data) do
    # Agent.start_link(fn -> data end, name: __MODULE__)
    Agent.start_link(fn -> data end) #{:ok, pid}
  end

  def value(pid) do
    Agent.get(pid, & &1)
  end

  def increment(pid) do
    Agent.update(pid, &(&1 + 1))
  end
end
