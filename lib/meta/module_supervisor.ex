defmodule Meta.ModuleSupervisor do
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      %{id: Server, start: {Server, :start_link, ["6", %{name: "NAME"}]}},
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
