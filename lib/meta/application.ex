defmodule Meta.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Meta.Worker.start_link(arg)
      # {Meta.Worker, arg}
      {Registry, keys: :unique, name: Meta.Registry},
      %{id: Server, start: {Server, :start_link, ["1", %{name: "NAME"}]}},

      {DynamicSupervisor, name:  DynamicSupervisor, strategy: :one_for_one},
      # %{id: Meta.DynamicSupervisor, start: {Meta.DynamicSupervisor, :start_link, ["dsd"]}}
      {DynamicSupervisor, name: Meta.DynamicSupervisor},

      #module run
      {Meta.ModuleSupervisor, []},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Meta.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
