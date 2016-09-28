defmodule Starwars do
  use Application

  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start your own worker by calling: Starwars.Worker.start_link(arg1, arg2, arg3)
      # worker(Starwars.Worker, [arg1, arg2, arg3]),
      worker(Starwars.GraphQL.StarWarsDB, [])
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Starwars.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
